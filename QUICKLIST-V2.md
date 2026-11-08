# Quicklist 2

**Phone:** take photos, group them into items, add an optional hint ("dash cam"). Each item is sent to your computer.
**Chrome extension:** everything else. It reads your Amazon orders, matches each item to what you bought, reads the
exact Amazon product (title, live price, features, photos, link), has Claude write the listing, lets you edit it in the
side panel, and fills Facebook Marketplace.

No spreadsheet needed: the extension searches your Amazon orders directly. CSV import is still there as a backup.

## Upgrading from version 1 (about 10 minutes)

1. **Check nothing is stuck on the phone.** Open the old app's Setup and tap Sync now. Every listing should show in the
   extension before you continue.
2. **Supabase:** open your project's SQL Editor, paste in `supabase-update-3.sql`, and click Run.
3. **Phone app:** upload `index.html`, `sw.js` and `manifest.webmanifest` from `quicklist-v2-phone.zip` to your GitHub
   repository, replacing the old ones. Your sync connection carries over.
4. **Extension:** unzip `quicklist-v2-extension.zip` over your existing extension folder (replace the files), then click
   the reload arrow in `chrome://extensions` and reload any Facebook tabs. Your connection carries over.
5. **Extension settings** (Settings button in the side panel). These used to live on the phone, so set them once here:
   - **Claude:** paste your API key and click Test key.
   - **Amazon:** pick your Amazon site (amazon.ca) and make sure you're signed in to Amazon in this Chrome.
   - **Pricing**, **Description** (backstory, pickup note, Amazon link) and **Photos**.

## Day to day

1. Photograph items on your phone. Tap **Next item** after each one.
2. That's it until you're ready to post: whenever Chrome is open on your computer, Quicklist writes new items in the
   background (about once a minute), even with the side panel closed. The extension icon shows how many listings are
   ready to post. (You can turn this off in Settings → Claude.)
3. Tap **Edit** on any listing to change its title, price, condition, category, description or Amazon link. Changes save
   by themselves.
4. On Facebook: **List this item** for one item, or tick listings (or Select all) and click **List multiple**. It opens
   Create Multiple Listings, adds one row per ticked listing and fills them. (Already on that page with rows? It fills
   those rows instead.)
5. Publish on Facebook, then **Mark posted**.

## Good to know

- Your phone works any time. Listings get written whenever your computer has Chrome open; items wait safely until then.
- Each item is found by searching all your Amazon orders (like the Search Orders box), so there's nothing to sync.
- Asking prices are a share of Amazon's live price (Settings → Pricing), always rounded up to the next $10. Prices are
  re-checked against Amazon when you fill Facebook, and the side panel tells you if one changed.
- **Rewrite** on a listing writes it again from scratch (your edits to it are replaced).
- Deleting an item on the phone or in the extension removes it from both.
- The extension reads Amazon pages from your own logged-in browser. It's light, occasional use, but it is automated.
- Not found in your orders? Settings → Amazon → **Test Amazon** copies a report of what the order search returned.
