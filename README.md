# Trip Atlas

A travel map app for iPhone. Your trips are the home screen; each trip's places sit on a vector map with photos, notes, directions and your live location. Optional accounts sync trips between devices and let you share them.

Live: https://lucas-ayub.github.io/travel-guide-app/

## Install on iPhone

Open the link in Safari, tap Share → Add to Home Screen, then always open Trip Atlas from its icon. The home screen app and Safari keep separate sign-ins.

After an update, close the app completely and open it again. GitHub Pages can take up to about 10 minutes to serve the new version. The bottom of the Account tab shows which version you have ("Trip Atlas · updated …").

## Features

- **Trips** – the home screen: the current or next trip as a large card with its cover photo, countdown and progress, then your other trips and past trips.
- **Map** – MapLibre GL with OpenFreeMap styles (Auto, Liberty, Bright, Light, Dark). Places are numbered pins coloured by group (a day, a city or a category); the chips at the top filter by group. The list at the bottom shows the same places with photos and live distance.
- **Adding places** – search by name or address (Photon), use the map centre or your location, or press and hold on the map. Each place has a group, notes and an optional English Wikipedia title that steers the photos.
- **Visited** – tap the round tick next to a place in the list, or *Mark as visited* on its card. Visited places leave the map and the list and move to the *Visited* chip ("Already visited"), with the day and time you marked them. *Undo* in the message, or the same tick or button, puts a place back. Visited marks are saved in the trip, so they sync to your other devices and to people who can edit the trip.
- **Place card** – photos, notes, a short Wikipedia summary, directions in Google Maps or Apple Maps, and opening hours.
- **Photos** – found automatically from free sources only, in this order:
  1. traveller photos from Flickr and Wikimedia Commons, through Openverse, searched by name and city
  2. the photos Wikidata and most Wikipedia languages use for the place
  3. traveller photos under the place's other names (Wikipedia title, local-language names)
  4. the place's Wikimedia Commons category
  5. photos taken at the spot whose file name names the place
  6. photos of the surroundings, marked "Nearby"

  Maps, drawings, paintings, black-and-white and archive images are filtered out. In the full-screen viewer you can pick the cover photo or hide a photo.
- **Accounts and sync** – name, email and password (Supabase). *Keep me signed in* is on by default and keeps you signed in after closing the app; turn it off on a shared device. Your account and trips appear straight away when the app opens, also offline, and changes sync when you are back online.
- **Sharing** – invite someone by email with *Can edit* or *Can view*; the trip appears in their Trips tab once they sign in with that email.
- **Backup** – export one trip or all trips as a JSON file; import a backup or a Google My Maps .kml.

## Files

- `index.html` – the whole app (HTML, CSS and JavaScript)
- `config.js` – Supabase project URL and publishable (anon) key; leave both empty to use the app without accounts
- `setup.sql` – run once in Supabase → SQL Editor to create the trips table
- `sharing.sql` – run once after `setup.sql` to enable sharing
- `manifest.webmanifest`, `icon.png`, `icon-512.png`, `logo.svg` – home screen app name, colours and icons

## Notes

- **Supabase settings** – Authentication → Sign In / Providers → Email: *Confirm email* off. Authentication → URL Configuration: Site URL and Redirect URLs set to the live address above, so password reset links work.
- **Openverse** allows at most 20 results per search without an API key; asking for more returns 401, so the app asks for 20.
- **iOS 26 home screen apps** can end the page above the bottom of the screen by about the status bar height. The app measures this when it opens and extends the map, panels and tab bar to the bottom edge.
- Libraries load from jsDelivr: MapLibre GL 4.7.1 and supabase-js 2.49.4.
