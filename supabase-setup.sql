-- Quicklist sync (version 2): run once in a NEW Supabase project's SQL Editor.
-- (Already set up with version 1? Run supabase-update-3.sql instead.)

create table if not exists public.listings (
  id            text primary key,
  user_id       uuid not null default auth.uid() references auth.users on delete cascade,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now(),
  status        text,            -- new, writing, ready or failed
  hint          text,            -- what the phone said the item is (optional)
  error         text,
  title         text,
  price         numeric,
  price_low     numeric,
  price_high    numeric,
  condition     text,
  category      text,
  description   text,
  check_note    text,
  amazon_url    text,
  retail_price  numeric,
  retail_source text,
  order_name    text,
  order_url     text,
  photos        text[] not null default '{}',
  posted        boolean not null default false
);

alter table public.listings enable row level security;
grant select, insert, update, delete on public.listings to authenticated;

drop policy if exists "own listings" on public.listings;
create policy "own listings" on public.listings
  for all to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

insert into storage.buckets (id, name, public) values ('photos', 'photos', false)
  on conflict (id) do nothing;

drop policy if exists "own photos select" on storage.objects;
drop policy if exists "own photos insert" on storage.objects;
drop policy if exists "own photos update" on storage.objects;
drop policy if exists "own photos delete" on storage.objects;
create policy "own photos select" on storage.objects for select to authenticated
  using (bucket_id = 'photos' and (storage.foldername(name))[1] = auth.uid()::text);
create policy "own photos insert" on storage.objects for insert to authenticated
  with check (bucket_id = 'photos' and (storage.foldername(name))[1] = auth.uid()::text);
create policy "own photos update" on storage.objects for update to authenticated
  using (bucket_id = 'photos' and (storage.foldername(name))[1] = auth.uid()::text);
create policy "own photos delete" on storage.objects for delete to authenticated
  using (bucket_id = 'photos' and (storage.foldername(name))[1] = auth.uid()::text);
