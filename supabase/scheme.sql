create extension postgis with schema extensions;

create table if not exists public.shops (
  id uuid not null primary key default uuid_generate_v4(),
  name varchar(100) not null,
  comment varchar(500),
  link_url varchar(500),
  location geography(POINT) not null,
  -- longitude varchar(100), -- 経度
  -- latitude varchar(100), -- 緯度
  is_open bool not null,
  created_at timestamp with time zone default timezone('utc' :: text, now()) not null,
  updated_at timestamp with time zone default timezone('utc' :: text, now()) not null
);

create index shops_geo_index
  on public.shops
  using GIST (location);

alter table
  public.shops enable row level security;

create policy "Allow select for all shops." on public.shops for
select
  using (true);

create or replace function nearby_shops(lat float, long float)
returns setof record
language sql
as $$
  select id, name, st_astext(location) as location, st_distance(location, st_point(long, lat)::geography) as dist_meters
  from public.shops
  order by location <-> st_point(long, lat)::geography;
$$;
