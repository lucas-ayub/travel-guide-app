-- Trip Atlas: sharing trips with other users.
-- Run this once in Supabase → SQL Editor → New query → Run (after setup.sql).

create table if not exists public.trip_shares (
  trip_id     text not null references public.trips (id) on delete cascade,
  email       text not null,
  role        text not null default 'editor' check (role in ('viewer', 'editor')),
  invited_by  uuid default auth.uid(),
  created_at  timestamptz not null default now(),
  primary key (trip_id, email)
);

alter table public.trip_shares enable row level security;

-- Returns 'owner', 'editor', 'viewer' or null for the signed-in user.
create or replace function public.trip_role(tid text)
returns text
language sql
stable
security definer
set search_path = public
as $$
  select case
    when exists (select 1 from public.trips t where t.id = tid and t.user_id = auth.uid()) then 'owner'
    else (
      select s.role from public.trip_shares s
      where s.trip_id = tid and lower(s.email) = lower(coalesce(auth.jwt() ->> 'email', ''))
      limit 1
    )
  end
$$;

revoke all on function public.trip_role(text) from public;
grant execute on function public.trip_role(text) to authenticated;

-- Trips: owners do everything; people it is shared with can read, editors can also update.
drop policy if exists "Users manage their own trips" on public.trips;
drop policy if exists trips_select on public.trips;
drop policy if exists trips_insert on public.trips;
drop policy if exists trips_update on public.trips;
drop policy if exists trips_delete on public.trips;

create policy trips_select on public.trips for select
  using (user_id = auth.uid() or public.trip_role(id) in ('viewer', 'editor'));
create policy trips_insert on public.trips for insert
  with check (user_id = auth.uid());
create policy trips_update on public.trips for update
  using (user_id = auth.uid() or public.trip_role(id) = 'editor')
  with check (user_id = auth.uid() or public.trip_role(id) = 'editor');
create policy trips_delete on public.trips for delete
  using (user_id = auth.uid());

-- An editor can never take ownership of a trip.
create or replace function public.keep_trip_owner()
returns trigger
language plpgsql
as $$
begin
  new.user_id := old.user_id;
  return new;
end
$$;

drop trigger if exists keep_trip_owner on public.trips;
create trigger keep_trip_owner before update on public.trips
  for each row execute function public.keep_trip_owner();

-- Shares: the owner manages them; invited people can see and remove their own invite.
drop policy if exists shares_select on public.trip_shares;
drop policy if exists shares_insert on public.trip_shares;
drop policy if exists shares_update on public.trip_shares;
drop policy if exists shares_delete on public.trip_shares;

create policy shares_select on public.trip_shares for select
  using (public.trip_role(trip_id) = 'owner' or lower(email) = lower(coalesce(auth.jwt() ->> 'email', '')));
create policy shares_insert on public.trip_shares for insert
  with check (public.trip_role(trip_id) = 'owner');
create policy shares_update on public.trip_shares for update
  using (public.trip_role(trip_id) = 'owner');
create policy shares_delete on public.trip_shares for delete
  using (public.trip_role(trip_id) = 'owner' or lower(email) = lower(coalesce(auth.jwt() ->> 'email', '')));
