-- RLS is disabled on products table
-- This allows public read access via the Data API
-- No authentication required to fetch products
alter table public.products disable row level security;
