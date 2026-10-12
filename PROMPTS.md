# How Trip Atlas was vibe-coded

Trip Atlas was vibe-coded: the author described what he wanted in plain language and Claude (Anthropic's AI assistant) wrote the code, the SQL, the logo and the setup steps. This file is the conversation that built the app, translated from Portuguese into English, in order. Each prompt is followed by a short summary of Claude's reply.

To keep it private, the real trip was replaced with a made-up trip to Venice. Personal details (flight times, hotel, email address, project URLs and keys) are left out or replaced with a description in [square brackets]. Screenshots the author attached are noted as [screenshot]. Features added in later sessions (marking places as visited, full-screen layout on iOS 26, staying signed in) are not covered here.

---

## 1. Planning the trip

**Prompt**
> My flight lands in Venice on the morning of the first day and leaves in the evening of the third. [Hotel.] Please plan my itinerary.

**Claude**
Planned three days from the hotel: day 1 around San Marco (the square, the basilica, the Doge's Palace) ending at the Rialto at sunset; day 2 in Dorsoduro and Cannaregio; day 3 a light morning before heading to the airport. Noted opening hours and that the city is best walked, with vaporetto passes for longer hops.

**Prompt**
> Also consider a day trip to Murano and Burano, the Bridge of Sighs, and the Peggy Guggenheim Collection.

**Claude**
Reordered the days around opening hours: the Guggenheim on a day it is open, the islands on the last morning with luggage stored, and a reminder to bring ID.

**Prompt**
> Check whether the city pass is worth it.
> St Mark's Basilica, the Rialto Bridge (maybe by day and by night), a gondola ride, the Grand Canal by vaporetto, the Bridge of Sighs, the Doge's Palace, the Campanile, Libreria Acqua Alta, the Peggy Guggenheim Collection, Ca' d'Oro, Scala Contarini del Bovolo, the Arsenale, a cicchetti bar, and Murano and Burano.

**Claude**
Compared the pass price with the individual tickets for the paid sights on the list and with student discounts. Conclusion: worth it only if you do most of the paid sights in its validity window; otherwise buy single tickets. Rebuilt the itinerary day by day around that.

## 2. From a map to an app

**Prompt**
> Please make a Google My Maps map with all these sights so I can see where each one is (and add some sights on the islands too).

**Claude**
Claude can't create a map in someone's Google account, so it wrote a KML file with every place, grouped and coloured by day, with notes, plus the steps to import it into My Maps.

**Prompt**
> Is there a mobile app or something else where I can make the map and still see photos of each sight?

**Claude**
Explained that imported pins don't carry photos. Suggested saved lists in Google Maps (photos, hours, reviews) or a trip planner app like Wanderlog for planning by day.

**Prompt**
> Is there one you can make for me, with photos, so I don't have to do it by hand?

**Claude**
Showed an interactive map in the chat with every place linked to its listing (photos, hours), grouped by day, and corrected the plan where opening days clashed.

**Prompt**
> I need to be able to use the map on my iPhone. Can you build a local app where I create maps, that has some photos of each sight and can see my location? It doesn't need to plan routes, I can do that in Maps, but it should at least have the photos of the sights. I want to be able to reuse the app for other trips to other destinations.

**Claude**
Built the first version as a single HTML file: a Leaflet map, trips with colour-coded groups, a list with photos, place cards with photos and a summary from Wikipedia, live location with distances, directions buttons for Google and Apple Maps, KML import and JSON backup. Explained that the iPhone only shares location with HTTPS pages, so it needs to be hosted (GitHub Pages) and added to the home screen.

## 3. Getting it onto GitHub and the iPhone

**Prompt**
> Can I create a repository and give you access?

**Claude**
Yes: create a public repository and send its name; Claude would connect it and push the files. Turning on GitHub Pages would be the author's step.

**Prompt**
> [The commands GitHub shows for a new, empty repository.]

**Claude**
Connected the repository and committed the app, but the push was refused because the Claude GitHub App wasn't installed on it. Explained how to install it.

**Prompt**
> Is there a way for me to push it?

**Claude**
Gave two ways: upload the files in the GitHub website, or copy them into a local clone and push from the terminal.

**Prompt**
> I haven't done anything, I only created the repository. Please make the app in English, then give me the exact steps to upload it to git and then to run it on my phone.

**Claude**
Translated every label, message and the example trip into English. Gave step-by-step instructions: upload the files on GitHub, turn on Pages, open the link in Safari, Add to Home Screen, allow location.

**Prompt**
> [screenshot] This is what shows up on my iPhone.

**Claude**
The app worked, but the map background showed "API key required": the tile provider had started requiring a key. Switched to OpenStreetMap tiles, with a darkened version for dark mode.

**Prompt**
> Create a local folder that I can connect to GitHub, so you can work in the local repository and I push to git.

**Claude**
Asked for access to the projects folder on the author's Mac. The tools to write files there didn't load in that session, so it gave the terminal commands to do it.

**Prompt**
> ok

**Claude**
The file tools still weren't available. Gave the full set of commands to create the folder, add the files, commit and push.

**Prompt**
> Can you ask for permission to do that?

**Claude**
Explained that the folder permission was already granted; the missing piece was the file tools in that session, not a permission. Screen control can't type into the Terminal, so the commands were still the fastest route.

**Prompt**
> Can you summarise this conversation and give me the information to send to Claude Code so it can change my folders etc.?

**Claude**
Wrote a handoff file for Claude Code: the repository, what to do step by step, the map fix, and how the app works inside.

**Prompt**
> I installed Claude on the repository.

**Claude**
Pushed. Found the author had also uploaded files through the website, so it put the fix on top instead of overwriting them, and fixed commit authorship.

**Prompt**
> [screenshot] I can't delete the main branch.

**Claude**
Explained that a default branch can't be deleted and how to make another branch the default first. From the screenshot it confirmed the branch was already deleted and the page just needed a refresh.

**Prompt**
> ok, now how do I run it?

**Claude**
Gave the GitHub Pages settings and the iPhone steps again: open in Safari, Add to Home Screen, open from the icon, allow location.

## 4. Redesign, accounts and a real map

**Prompt**
> It worked. I want the app to get better: I want to be able to create accounts in the app with a name and email, a tab with the trips, a better hub, a nicer design, and a better map (the map API you're using is really ugly, the map is really, really ugly). Also, create a cooler logo for the app.

**Claude**
Asked one question first: real accounts in the cloud, or profiles on this device only.

> [Chose "real accounts in the cloud".]

Rebuilt the app: a Trips tab as the home screen with a large card for the next trip and a countdown, a vector map (MapLibre GL with OpenFreeMap styles, selectable in settings), a bottom tab bar, a new place card with a photo carousel, a new logo (a coral pin over a globe with a dotted route), a web manifest, and accounts with sync through Supabase. Tested the published page in a browser and fixed two layout issues it found. Listed the Supabase setup steps.

**Prompt**
> Where is setup.sql?

**Claude**
Linked it in the repository and pasted the SQL to run in the Supabase SQL editor.

**Prompt**
> It worked.

**Claude**
Listed the remaining Supabase steps.

**Prompt**
> [screenshot of the Supabase email template page] I'm at this step, guide me through everything I still have to do.

**Claude**
Saw that new Supabase projects can't edit email templates without custom SMTP, so the emailed-code plan wouldn't work. Switched the app to name, email and password, and gave the remaining steps: turn off email confirmation, then copy the project URL and publishable key.

> [Shared the project URL and publishable key.]

Added them to the config file, made phones reload it, and checked from the published page that sign-in and the trips table answered correctly, without creating any account.

## 5. Accounts that feel like accounts

**Prompt**
> After I sign in, not much shows up. I want the account icon to be the person's initial, like the Gmail default, and each user to have their own trips.

**Claude**
Added Gmail-style avatars (the initial on a colour derived from the email) in the header and tab bar, and a fuller Account tab: profile, counts of trips, places and upcoming trips, the next trip, and sync status. New accounts start empty; trips saved on the device only join an account if the user taps "Add to my account".

**Prompt**
> [screenshot] I'm signed in but it looks like I'm not, that felt really weak. Another thing: when I move the map, the sight pins move around a lot when I zoom in and out.

**Claude**
Spotted from the screenshot that it was Safari, not the home screen app; on iPhone the two keep separate sign-ins. Fixed the drifting pins (a CSS transition was animating the map library's own positioning) and redrew them as teardrops whose tip sits on the spot. Made errors clearly visible, added a "Signed in" badge and a "Forgot password?" flow, plus the Supabase settings it needs.

**Prompt**
> I want to be able to share trip maps with other users of the app. Also, give me an import file for the Venice trip so I can add it to my account.

**Claude**
Added sharing by email with "Can edit" or "Can view". It came with a second SQL file with a shares table, a role helper and row-level security, so editors can't take over a trip and only the owner can delete it or invite people. Shared trips show "Shared by …", viewers get a read-only map, and anyone can leave a trip. Sync now also runs every minute while the app is open. Exported the trip as a JSON file to import, and gave the steps.

## 6. Better photos

**Prompt**
> [screenshot] For the sights' images, make it possible to view them inside the app; right now when I tap one I'm sent to Wikipedia. Can the images be sized better? Some of them look really bad. Do you know a better source than Wikipedia that shows better pictures of the actual sight?

**Claude**
Added a full-screen photo viewer with swipe, double-tap zoom and the photographer's credit. Photos are now shown whole over a blurred fill instead of being cropped. Changed the photo source to the place's official image and curated Wikimedia categories. Mentioned Google Maps photos as the best paid option.

**Prompt**
> [screenshot of a close-up of a rusty metal plate shown as a photo of the Rialto Bridge] Look at the second photo for the Rialto. I think the photos being pulled in are horrible. Find good sources for photos of sights. Think about it, reflect on what you can do better, think hard.

**Claude**
Explained the mistake: the "Quality image" badge rates technique, not whether a photo shows the place. Tested a better signal on real places first: rank the photos used in the place's Wikipedia articles by how many language editions chose them. Filtered out maps, plans, coats of arms, paintings and pre-1960 images. Fixed a bug that saved temporary errors as "no photos". Added "Hide this photo" and "Use as cover" in the viewer.

**Prompt**
> I don't want to pay for images, I just want good images without paying. Try harder.

**Claude**
Compared free sources on real places and looked at the results. Openverse (open-licence photos, mostly from Flickr, no key needed) gave the best traveller shots. Made it the main source, searched by place name plus city, and required the place's name in the title or tags. Blended in the most-used Wikipedia photos. Added a colourfulness score so drawings and black-and-white archive images are dropped automatically. Removed the paid Google option.

**Prompt**
> Can you add backup sources, like secondary sources for when nothing is found in the best ones, in an order of priority?

**Claude**
Set up six free sources in order: (1) traveller photos by name and city, (2) the Wikidata image and the most-used Wikipedia photos, (3) traveller photos under the place's other names, including local-language names, (4) the place's Wikimedia Commons category, (5) photos at the spot whose file name names the place, (6) photos of the surroundings, same street first, at most three, labelled "Nearby". Lower tiers only run while fewer than six good photos are found, and every photo passes the same checks. The viewer credit now names the source.

## 7. This file

**Prompt**
> Can you make it clear in the project README that it was vibe-coded, and add the history of prompts, in English, that were used to make the app (without leaking anything private)?

**Claude**
Added a "Vibe-coded" note at the top of the README and wrote this file with the prompts, leaving out flight times, the hotel, the email address and the project keys. Pointed out that the example trip in the app still named the real hotel and flight times.

**Prompt**
> Please change them.

**Claude**
Replaced the hotel in the example trip with a generic "Hotel" in the city centre and the flight times with "Arrival and departure", and checked that none of those details were left in the repository's files.

**Prompt**
> I want your replies to the prompts too (again following the rules about API keys, trip-specific details etc., and swap the destination for Venice as well).

**Claude**
Rewrote this file as a conversation: each prompt with a short summary of the reply, private details removed, and the trip changed to Venice.

## 8. Living with it on the iPhone

**Prompt**
> I want the app to look good. See how there are black bars at the bottom? Also, I want my login saved: I signed in, but when I close the app and open it again it doesn't remember me. Please add an option to save the login when signing in the first time.

**Claude**
Traced the black bar to an iOS 26 bug in home screen apps: the page ends above the bottom of the screen by about the status bar height. The app now measures the gap when it opens and stretches the map, panels and tab bar to the edge. Added *Keep me signed in* (on by default) to the sign-in screen and the Account tab. The account and trips now appear as soon as the app opens, even offline, instead of a guest screen while the server answers; the email is prefilled when signing in again. Mentioned that traveller photos had stopped loading.

**Prompt**
> I'd like to mark the places I've already been to during the trip as visited, so they go to an "already visited" tab or something like that and stop showing up. Please keep the good photo sources, the photos were really nice. And remember to always update the README when you update the app.

**Claude**
Added a round tick next to each place in the list and *Mark as visited* on its card. Visited places leave the map and the list and move to a *Visited* chip, with the day and time they were marked; *Undo* brings them back, and the state syncs across devices. Found why traveller photos had stopped: Openverse now rejects searches asking for more than 20 results without a key, so the app asks for 20 and the photo order is unchanged. Rewrote the README to describe the whole app.

**Prompt**
> Add a search bar for the places.

**Claude**
Added a magnifier at the top of the Map tab and a search field at the top of the place list. It filters the trip's places as you type, looking at names, notes, groups and Wikipedia titles, ignoring accents and case ("rialto" finds Ponte di Rialto). Every word must match and the matching text is highlighted. Visited places are included, the map shows only the matching pins, and tapping a result opens its card. *Cancel*, closing the list or switching trips ends the search. Adding new places is still the **+** button.

**Prompt**
> You added the search bar for the places, update PROMPTS.md. And from now on, every time you add a new feature to the app, update the prompt history too.

**Claude**
Added this section with the last three changes and will keep the file up to date with each new feature.
