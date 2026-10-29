# Quicklist

Photograph items and get Facebook Marketplace listings written by Claude.
Everything (photos, listings, your API key) stays on your phone. The only
thing that leaves it is each item's photos, sent to Anthropic to write the listing.

## Files

- index.html: the app
- manifest.webmanifest, icon-192.png, icon-512.png: let Chrome install it as an app
- sw.js: caches the app so it opens fast

## Put it online with GitHub Pages (free, about 5 minutes)

1. Sign in at github.com (create a free account if you need one).
2. Click **+** at the top right, then **New repository**. Name it `quicklist`,
   set it to **Public**, and click **Create repository**.
3. On the new repository page, click **uploading an existing file**. Drag in all
   six files from this folder (not the folder itself) and click **Commit changes**.
4. Open **Settings**, then **Pages** in the left menu. Under **Branch**, choose
   `main` and `/ (root)`, then click **Save**.
5. Wait a minute or two, then refresh that page. It shows your address, like
   `https://YOUR-NAME.github.io/quicklist/`.

## Set it up on your phone

1. Open that address in Chrome on your phone.
2. Open the ⋮ menu and choose **Add to Home screen** (or **Install app**).
3. Open Quicklist from your home screen, go to **Setup**, and paste your API key.
   Tap **Test key** to confirm it works.

## Get an API key

1. Go to console.anthropic.com and sign in.
2. Add a little credit under **Billing**. API usage is billed separately from a
   Claude.ai subscription.
3. Open **API keys**, create a key, and copy it into Quicklist.

Treat the key like a password. Quicklist keeps it only in your phone's browser
storage and never puts it in the files you upload, so the public repository is safe.
Anyone who has your unlocked phone could use it, though. If you lose the phone,
delete the key in the console. You can also set a monthly spend limit there.

## Updating the app

Upload the changed file to the same repository (it replaces the old one).
The app picks up the new version the next time you open it with a connection.
