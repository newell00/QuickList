-- Quicklist update: lets each listing carry the Amazon order it came from,
-- so the Chrome extension can open that order and find the exact product link.
-- Run once in your Supabase project's SQL Editor.
alter table public.listings add column if not exists order_name text;
alter table public.listings add column if not exists order_url text;
