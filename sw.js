// Trip Atlas service worker. Chrome and Edge only offer to install apps that have one.
// It passes pages straight to the network and caches nothing, so every launch gets the latest version.
self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', e => e.waitUntil(self.clients.claim()));
self.addEventListener('fetch', e => {
  if (e.request.mode === 'navigate') e.respondWith(fetch(e.request));
});
