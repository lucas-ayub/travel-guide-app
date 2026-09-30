-- Trip Atlas: run this once in Supabase → SQL Editor → New query → Run.

create table if not exists public.trips (
  id          text primary key,
  user_id     uuid not null default auth.uid() references auth.users (id) on delete cascade,
  data        jsonb not null,
  updated_at  timestamptz not null default now(),
  deleted     boolean not null default false
);

create index if not exists trips_user_id_idx on public.trips (user_id);

alter table public.trips enable row level security;

drop policy if exists "Users manage their own trips" on public.trips;
create policy "Users manage their own trips"
  on public.trips
  for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
