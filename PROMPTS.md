# Prompt history

Trip Atlas was vibe-coded: the author described what he wanted in plain language and Claude (Anthropic's AI assistant) wrote the code, the SQL, the logo and the setup steps. These are the author's prompts from the session that built the app, translated from Portuguese into English, in order.

Personal details (flight times, hotel, email address, project keys) are left out or replaced with a description in [square brackets]. Screenshots the author attached are noted as [screenshot]. Features added in later sessions (marking places as visited, full-screen layout on iOS 26, staying signed in) are not covered here.

## 1. Planning the trip

> My flight lands in Copenhagen on the morning of the first day and leaves on the evening of the third. [Hotel name.] Please put together my itinerary.

> Also consider a day trip to Malmö, the "Shrek church" and the Louisiana Museum.

> Check whether the Copenhagen Card is worth it.
> Tivoli Gardens, Nyhavn (maybe by day and by night to see the lights), LEGO Store, canal tour, Little Mermaid statue, Grundtvig's Church, Frederik's Church, Black Diamond library, Louisiana Museum, Amalienborg Palace, Rosenborg Palace, Christiansborg Palace (+ rooftop), Christianshavn canal, Design Museum, Glyptotek, Gasoline Grill, Old University Library, and Malmö.

## 2. From a map to an app

> Please make a Google My Maps map with all these sights so I can see where each one is (and add some Malmö sights too).

> Is there a mobile app or something else where I can make the map and still see photos of each sight?

> Is there one you can make for me, with photos, so I don't have to do it by hand?

> I need to be able to use the map on my iPhone. Can you build a local app where I create maps, that has some photos of each sight and can see my location? It doesn't need to plan routes, I can do that in Maps, but it should at least have the photos of the sights. I want to be able to reuse the app for other trips to other destinations.

## 3. Getting it onto GitHub and the iPhone

> Can I create a repository and give you access?

> [The commands GitHub shows for a new, empty repository.]

> Is there a way for me to push it?

> I haven't done anything, I only created the repository. Please make the app in English, then give me the exact steps to upload it to git and then to run it on my phone.

> [screenshot] This is what shows up on my iPhone.

> Create a local folder that I can connect to GitHub, so you can work in the local repository and I push to git.

> ok

> Can you ask for permission to do that?

> Can you summarise this conversation and give me the information to send to Claude Code so it can change my folders etc.?

> I installed Claude on the repository.

> [screenshot] I can't delete the main branch.

> ok, now how do I run it?

## 4. Redesign, accounts and a real map

> It worked. I want the app to get better: I want to be able to create accounts in the app with a name and email, a tab with the trips, a better hub, a nicer design, and a better map (the map API you're using is really ugly, the map is really, really ugly). Also, create a cooler logo for the app.

> [Chose "real accounts in the cloud" over "profiles on this device only".]

> Where is setup.sql?

> It worked.

> [screenshot of the Supabase email template page] I'm at this step, guide me through everything I still have to do.

> [Shared the Supabase project URL and publishable key.]

## 5. Accounts that feel like accounts

> After I sign in, not much shows up. I want the account icon to be the person's initial, like the Gmail default, and each user to have their own trips.

> [screenshot] I'm signed in but it looks like I'm not, that felt really weak. Another thing: when I move the map, the sight pins move around a lot when I zoom in and out.

> I want to be able to share trip maps with other users of the app. Also, give me an import file for the Copenhagen trip so I can add it to my account.

## 6. Better photos

> [screenshot] For the sights' images, make it possible to view them inside the app; right now when I tap one I'm sent to Wikipedia. Can the images be sized better? Some of them look really bad. Do you know a better source than Wikipedia that shows better pictures of the actual sight?

> [screenshot of a close-up of a rusty metal plate shown as a photo of Nyhavn] Look at the second photo for Nyhavn. I think the photos being pulled in are horrible. Find good sources for photos of sights. Think about it, reflect on what you can do better, think hard.

> I don't want to pay for images, I just want good images without paying. Try harder.

> Can you add backup sources, like secondary sources for when nothing is found in the best ones, in an order of priority?

## 7. This file

> Can you make it clear in the project README that it was vibe-coded, and add the history of prompts, in English, that were used to make the app (without leaking anything private)?
