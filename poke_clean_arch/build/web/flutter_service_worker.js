'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "2d0931f33ba8177f85e8e94d19d7228a",
"assets/AssetManifest.json": "6319868fbe94092622fb203be993e869",
"assets/assets/height.svg": "cac548730f5b220879e89276ca65fda6",
"assets/assets/hit_background.png": "b00bafd16b176e6faedd47046c9c7c2f",
"assets/assets/loading.json": "69ecab3ea8da4f89d8f4302a532c61de",
"assets/assets/pokebola-fundo-01.png": "75c7e7c4a4e71252c7fc253429e4cb2a",
"assets/assets/StatProg.svg": "258e725792b9ff980ab467d45f6e2bb3",
"assets/assets/types/bug.svg": "14540979a6685ab378bf0cee1e97f942",
"assets/assets/types/dark.svg": "fe2758f51752b7a0f8adaa5200d58fa4",
"assets/assets/types/dragon.svg": "c0252e8f6cc7242749d42aa32aa9fc50",
"assets/assets/types/electric.svg": "68407837ea4c46505c438a788d5e5406",
"assets/assets/types/fairy.svg": "24d6fd0860d3be8b072d10329a89391b",
"assets/assets/types/fighting.svg": "e72e76c442a8d346ff8ed02bd45b44e4",
"assets/assets/types/fire.svg": "e2e7ff4631fc8d32dd8628f639e4622b",
"assets/assets/types/flying.svg": "84b71c6f40b3145b579b7ccab54960ec",
"assets/assets/types/ghost.svg": "04ad8f7b5b68d3c23ae0f59d50b44603",
"assets/assets/types/grass.svg": "d589dd00e175efada7294faf05f52ac6",
"assets/assets/types/ground.svg": "a3ee3106e244b74dedc9ebadcaf48055",
"assets/assets/types/ice.svg": "52f29ae5643f3bfdc8193b18af2fcabd",
"assets/assets/types/normal.svg": "4d8ee5e4178ba62d421ae999fd29ae96",
"assets/assets/types/poison.svg": "1ff89de56897f31dd698fe9056b524b2",
"assets/assets/types/psychic.svg": "29fd7f9d6a31517326379fe368a16ffb",
"assets/assets/types/rock.svg": "58f22152b93c43e659c4d19396452008",
"assets/assets/types/steel.svg": "585083f6d8fb2f3fd408479a376cd1c6",
"assets/assets/types/water.svg": "fba54fcda2c58ae9350528b07ef8ae5c",
"assets/assets/weight.svg": "33edbc1266bb53ddf62af6127ec2b78d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "8c74d49fd0e09cb8050725f975757ce1",
"assets/NOTICES": "7279f1410ea1ab42ebd6c2f5ce11741d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "dd5b7e38ac853fcf41faa69cf49aa175",
"canvaskit/canvaskit.wasm": "6e7859012ffcf1d482a8bbc473b8171f",
"canvaskit/chromium/canvaskit.js": "36d162e8f857ceeacbf01ed75a382f56",
"canvaskit/chromium/canvaskit.wasm": "b3fabff5b6c1cb4d4e81f4551eba9ba2",
"canvaskit/skwasm.js": "5256dd3e40ec9fe1fc9faa51a116bcfd",
"canvaskit/skwasm.wasm": "4ca73baf420612f1657d5b2be4b7467d",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "a96e4cac3d2da39d86bf871613180e7b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "8e6a6cd4f71b5ae2c7a8d82fd58b96cf",
"/": "8e6a6cd4f71b5ae2c7a8d82fd58b96cf",
"main.dart.js": "e45d3b85aacea98f15a769797e947ce2",
"manifest.json": "8dad1ce866cda1c33a2b58e30ffe7723",
"version.json": "c7a0a4987dc212e7ea37731bebbf41fe"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
