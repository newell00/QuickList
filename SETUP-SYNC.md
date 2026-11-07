# Quicklist sync and Chrome extension: one-time setup

Listings you finish on your phone go to your own free Supabase project. The
Quicklist Chrome extension on your computer reads them from there and fills them
into Facebook Marketplace. Only you can see your listings and photos.

## 1. Create the Supabase project (about 10 minutes)

1. Go to supabase.com, sign up (free), and click **New project**. Pick any name
   and a region near you, set a database password (you won't need it again), and
   create the project. Wait a minute or two while it sets up.
2. Open **SQL Editor** in the left menu, click **New query**, paste in everything
   from `supabase-setup.sql`, and click **Run**. It should say "Success".
3. Create your login: open **Authentication** → **Users** → **Add user** →
   **Create new user**. Enter your email and a password, tick
   **Auto Confirm User**, and create it.
4. Stop anyone else signing up: in **Authentication** → **Sign In / Providers**,
   turn off **Allow new users to sign up** and save.
5. Get your connection details: click **Connect** at the top of the project page
   (or open **Project Settings** → **API Keys**). Copy the **Project URL** and the
   **Publishable key** (an older project may call it the **anon** key).

## 2. Connect the phone app

1. Upload the updated Quicklist files to your GitHub repository (replace the old ones).
2. Open Quicklist → **Setup** → **Sync to your computer**. Enter the Project URL,
   publishable key, and the email and password from step 3, then tap **Connect**.
3. Every finished listing now syncs automatically, including the ones you already
   have. Edits sync too, and deleting a listing deletes its photos.

## 3. Install the Chrome extension

1. Unzip `quicklist-extension.zip` somewhere you'll keep it (Chrome loads it from
   that folder, so don't delete it).
2. In Chrome, go to `chrome://extensions` and turn on **Developer mode** (top right).
3. Click **Load unpacked** and pick the unzipped folder.
4. Click the puzzle-piece icon in the toolbar and pin **Quicklist for Marketplace**.
5. Click its icon to open the side panel, and connect with the same four details.

## Never re-enter the connection details

Both the app and the extension remember the connection by themselves. To keep it
that way when you update:

- **Extension:** unzip each update over the same folder (replace the files), then
  click the reload arrow in `chrome://extensions`. Don't remove the extension and
  load it again.
- **Phone app:** just upload the changed files to GitHub. You only need to remove and
  re-add the home-screen icon when the icon itself changes.

As a backup, for when something does get reset:

- **Phone app:** in your GitHub repository, click **Add file** → **Create new file**,
  name it `sync-config.json`, and paste in the contents of `sync-config.example.json`
  with your Project URL, publishable key and email filled in. Never put your
  password in this file: the repository is public. (The URL and publishable key are
  designed to be public; your data stays protected by your login.) Quicklist then
  fills those in itself, and you only type your password. Update zips don't include
  this file, so uploading new versions never overwrites it.
- **Extension:** in the extension folder, copy `sync-config.example.json` to
  `sync-config.json` and fill it in. This file stays on your computer, so the
  password line is optional: with it, the extension signs itself in. Update zips
  don't include this file either.

## Using it

- **One listing:** on Facebook, open Marketplace → **Create new listing** →
  **Item for sale**. In the side panel, click **Fill this listing**. It adds the
  photos, title, price and description. Pick the category and condition yourself,
  check it over, and publish.
- **Several listings:** open **Create multiple listings**, add one row per item, then
  tick those listings in the side panel in the same order as the rows and click
  **Fill photos into rows**. Check each row got the right photos.
- **Mark posted** moves a listing to the Posted tab, on your phone too.

The extension never clicks Publish. You always review and post each listing yourself.

## Good to know

- Supabase's free plan includes 1 GB of photo storage, enough for roughly a
  thousand listings. Delete old listings in the app to free space.
- Free projects pause after about a week without use. If sync stops working after
  a break, open your project on supabase.com and click **Restore**.
- Facebook changes its pages from time to time. If filling stops working, the
  side panel says which fields it couldn't find.
