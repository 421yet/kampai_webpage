'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "0cedeeb29922917c03a28e9a643baed7",
"assets/AssetManifest.bin.json": "f8d708b6ad4af2b9872dc0fb2ecb8a1e",
"assets/AssetManifest.json": "2c005566e935e820b3d6a3930443892b",
"assets/assets/images/2024-03-25.jpg": "1d6e04c5f7933e25dbc216bbebea12d9",
"assets/assets/images/2024-03-25_resized.jpg": "5d3c985327c602d037a817fe10a55b5f",
"assets/assets/images/delivery/Clover_mobile_app_Logo.svg": "5c9e68135f61ed76e9760b6ea9e98f47",
"assets/assets/images/delivery/DoorDash_Logo.svg": "67563b5ef4f154bf1b41a00624b1f2af",
"assets/assets/images/delivery/GrubHub_2021.svg": "1c84731432d8775459a520aafff87846",
"assets/assets/images/delivery/Uber_Eats_2020_logo.svg": "ee037401cb5d31b23cf780808ee4ec1f",
"assets/assets/images/kampai_black.svg": "3267d323ce8e0f9705ce066daa95b772",
"assets/assets/images/kampai_white_black_bg.svg": "cf6de2ff2cf2e847de1058701391f266",
"assets/assets/images/kampai_white_font.svg": "0d0dd4c7560fd2b03611b989ba135db7",
"assets/assets/images/logo.png": "f5d8298d3628f610fcf9e11091eea735",
"assets/assets/images/logo_cropped.png": "a26a1574b04106e796f616507adcf7ec",
"assets/assets/images/menu/dinner.png": "b70cd66a012bd47b6cfd95a893f95bf0",
"assets/assets/images/menu/drinks.png": "fd17c3f5f4bd0b792b733ba9d49bd7d7",
"assets/assets/images/menu/Google_Sheets.svg": "d965dcf7ddd0c84e02d7551826b8c086",
"assets/assets/images/menu/Kampai%2520Menu_V6%2520-%2520Copy.png": "ebc16002f5076e4cf5791fbb660633cc",
"assets/assets/images/menu/Kampai%2520Menu_V6.png": "ebc16002f5076e4cf5791fbb660633cc",
"assets/assets/images/menu/lunch.png": "ebf682e5d45abc932104b1256abdd0ca",
"assets/assets/images/menu/sushi.png": "cb9a135094c51b2df2da1c6fe21c178a",
"assets/assets/images/menu/sushi_combined.png": "f2e8d4a63f5814b92b5c7c5f75c51198",
"assets/assets/images/menu/sushi_desc.png": "310ac1237db0b6bef070f2b81964161c",
"assets/FontManifest.json": "2f1ebedf6364e441385272a1fe631bb1",
"assets/fonts/MaterialIcons-Regular.otf": "805de9924d1055840d237ee48a98fce9",
"assets/NOTICES": "2a34d706fe0cd1d9b6143763cc0955e0",
"assets/packages/amplify_authenticator/assets/social-buttons/google.png": "a1e1d65465c69a65f8d01226ff5237ec",
"assets/packages/amplify_authenticator/assets/social-buttons/SocialIcons.ttf": "1566e823935d5fe33901f5a074480a20",
"assets/packages/amplify_auth_cognito_dart/lib/src/workers/workers.min.js": "bf513d4da5f72ba53d681dee925dc047",
"assets/packages/amplify_auth_cognito_dart/lib/src/workers/workers.min.js.map": "fa7f0624e4d4ad35845ad8cf03416399",
"assets/packages/amplify_secure_storage_dart/lib/src/worker/workers.min.js": "c21f04e68a1c1dcfecfad44bcd2e8953",
"assets/packages/amplify_secure_storage_dart/lib/src/worker/workers.min.js.map": "9b2bffbaa129cc1c87dc497827f159bd",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "9ce86b0170dc569e1349c6b53230fffb",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "369c6956ec9e171b8f7b491d2f63791a",
"index.html": "a78a1be7478cd3f483355d796e5c27f6",
"/": "a78a1be7478cd3f483355d796e5c27f6",
"main.dart.js": "01e116710f223198c5113e225e9f3335",
"manifest.json": "3a212681652b90c1f89096339df1de56",
"version.json": "46f04e406f0182271b39a581448c0365"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
