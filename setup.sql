-- Lexizia Solutions: run this ONCE in Supabase -> SQL Editor -> New query -> Run
-- 1) Put YOUR admin email in the line marked  <<< CHANGE THIS

create table if not exists public.admins (email text primary key);
insert into public.admins (email) values ('phelinewanjala@gmail.com')   -- <<< CHANGE THIS
on conflict do nothing;

create table if not exists public.products (
  id bigint generated always as identity primary key,
  category text not null check (char_length(category) between 1 and 80),
  name text not null check (char_length(name) between 1 and 120),
  price numeric check (price is null or price >= 0),
  active boolean not null default true,
  sort int not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.orders (
  id bigint generated always as identity primary key,
  ref text,
  kind text not null default 'order' check (kind in ('order','quote')),
  name text not null check (char_length(name) between 1 and 100),
  phone text not null check (char_length(phone) between 5 and 30),
  organisation text check (char_length(organisation) <= 120),
  email text check (char_length(email) <= 120),
  location text check (char_length(location) <= 200),
  items jsonb not null default '[]'::jsonb check (jsonb_typeof(items)='array' and jsonb_array_length(items) <= 100),
  notes text check (char_length(notes) <= 1500),
  status text not null default 'new' check (status in ('new','contacted','quoted','delivered','cancelled')),
  created_at timestamptz not null default now()
);

create or replace function public.is_admin() returns boolean
language sql stable security definer set search_path = public as $$
  select exists (select 1 from public.admins where lower(email) = lower(coalesce(auth.jwt() ->> 'email','')));
$$;
grant execute on function public.is_admin() to anon, authenticated;

alter table public.admins   enable row level security;   -- no policies = nobody can read it directly
alter table public.products enable row level security;
alter table public.orders   enable row level security;

drop policy if exists "products public read" on public.products;
create policy "products public read" on public.products for select to anon, authenticated using (active or public.is_admin());
drop policy if exists "products admin write" on public.products;
create policy "products admin write" on public.products for all to authenticated using (public.is_admin()) with check (public.is_admin());

drop policy if exists "orders anyone can place" on public.orders;
create policy "orders anyone can place" on public.orders for insert to anon, authenticated with check (status = 'new');
drop policy if exists "orders admin manage" on public.orders;
create policy "orders admin manage" on public.orders for all to authenticated using (public.is_admin()) with check (public.is_admin());

-- Starting catalogue (only if empty)
insert into public.products (category, name, sort)
select * from (values
  ('Office Stationery','A4 printing paper',1),
  ('Office Stationery','Photocopy paper',2),
  ('Office Stationery','Files & folders',3),
  ('Office Stationery','Registers & record books',4),
  ('Office Stationery','Pens & markers',5),
  ('Office Stationery','Staplers & punches',6),
  ('Office Stationery','Envelopes',7),
  ('Office Stationery','Notebooks & diaries',8),
  ('ICT Equipment','Laptops',9),
  ('ICT Equipment','Desktop computers',10),
  ('ICT Equipment','Printers & photocopiers',11),
  ('ICT Equipment','Toner & ink cartridges',12),
  ('ICT Equipment','Routers & network cables',13),
  ('ICT Equipment','Flash drives & storage',14),
  ('ICT Equipment','UPS & power backup',15),
  ('ICT Equipment','Software & licences',16),
  ('Furniture & Fittings','Office desks',17),
  ('Furniture & Fittings','Office chairs',18),
  ('Furniture & Fittings','Filing cabinets',19),
  ('Furniture & Fittings','Shelving & bookcases',20),
  ('Furniture & Fittings','School desks & lockers',21),
  ('Furniture & Fittings','Waiting-area seating',22),
  ('Uniforms & PPE','Staff uniforms',23),
  ('Uniforms & PPE','Overalls & dust coats',24),
  ('Uniforms & PPE','Safety boots',25),
  ('Uniforms & PPE','Gloves',26),
  ('Uniforms & PPE','Reflector jackets',27),
  ('Uniforms & PPE','Helmets & face masks',28),
  ('Cleaning & Hygiene','Detergents & soap',29),
  ('Cleaning & Hygiene','Disinfectants & sanitizer',30),
  ('Cleaning & Hygiene','Toilet paper & tissues',31),
  ('Cleaning & Hygiene','Mops, brooms & buckets',32),
  ('Cleaning & Hygiene','Bin liners & waste bins',33),
  ('Cleaning & Hygiene','Hand towels & dispensers',34),
  ('Hardware & Electrical','Hand tools',35),
  ('Hardware & Electrical','Electrical cables & sockets',36),
  ('Hardware & Electrical','Bulbs & lighting',37),
  ('Hardware & Electrical','Plumbing fittings',38),
  ('Hardware & Electrical','Paint & brushes',39),
  ('Hardware & Electrical','Locks & padlocks',40),
  ('Printing & Branding','Banners & signage',41),
  ('Printing & Branding','Branded T-shirts & caps',42),
  ('Printing & Branding','Calendars & diaries',43),
  ('Printing & Branding','ID cards & lanyards',44),
  ('Printing & Branding','Business cards & letterheads',45),
  ('Printing & Branding','Rubber stamps',46),
  ('Refreshments & Pantry','Tea & coffee',47),
  ('Refreshments & Pantry','Sugar & milk',48),
  ('Refreshments & Pantry','Bottled water',49),
  ('Refreshments & Pantry','Cups & kitchenware',50),
  ('Refreshments & Pantry','Biscuits & snacks',51)
) as v(category, name, sort)
where not exists (select 1 from public.products);
