-- Quicklist version 2: run once in your Supabase project's SQL Editor.
-- Adds what the Chrome extension needs to write listings itself (the phone now only sends photos).
alter table public.listings add column if not exists order_name   text;
alter table public.listings add column if not exists order_url    text;
alter table public.listings add column if not exists retail_price numeric;
alter table public.listings add column if not exists status       text;
alter table public.listings add column if not exists hint         text;
alter table public.listings add column if not exists error        text;
alter table public.listings add column if not exists price_low    numeric;
alter table public.listings add column if not exists price_high   numeric;
alter table public.listings add column if not exists check_note   text;
alter table public.listings add column if not exists retail_source text;
-- Listings written by version 1 are finished: mark them ready.
update public.listings set status = 'ready' where status is null and title is not null;
