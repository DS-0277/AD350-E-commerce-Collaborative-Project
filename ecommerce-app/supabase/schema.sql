create table public.products (
  id uuid not null default gen_random_uuid (),
  name text not null,
  category text not null,
  description text null,
  price numeric not null,
  sale_price numeric null,
  image_url text null,
  rating numeric null default 4.5,
  stock integer null default 100,
  is_featured boolean null default false,
  created_at timestamp with time zone null default now(),
  constraint products_pkey primary key (id)
) TABLESPACE pg_default;
