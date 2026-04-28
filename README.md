# MarketCorp — 6-Week Frontend × Backend Integration Plan

A focused plan to migrate the existing single-file storefront to a **React + Vite** frontend, integrate it with a **Supabase + PostgreSQL** backend, and verify every endpoint with **Postman**.

> Scope is integration only. No checkout, no admin panel, no production launch — those are out of scope.

## Current state (Week 0 — done)

- Working SPA at [index.html](index.html): vanilla HTML + Tailwind, hash router, four views (Landing / Catalog / Product / Cart)
- Mock product data + localStorage cart, Supabase client wired with fallback
- SQL schema for `products` + `cart_items` (with RLS) embedded in the file as a comment

## Target state (end of Week 6)

- React + Vite app replacing `index.html`, same four views
- Supabase Postgres holding products, cart, users; React queries it via `@supabase/supabase-js`
- Auth (email/password) wired through React context
- Postman collection covering every Supabase REST endpoint the app uses, runnable as a regression suite
- All env vars in `.env.local`, no secrets in source

## Stack

| Layer | Tech |
|---|---|
| Frontend | React 18, Vite, React Router, Tailwind, `@supabase/supabase-js` |
| Backend | Supabase (Postgres + Auth + auto-generated REST via PostgREST) |
| API testing | Postman (collection + environment + Newman for CLI runs) |

---

## Phase 1 — React + Vite migration (Week 1)

**Goal:** Same UI as `index.html`, but as a Vite-powered React app. No backend changes yet.

- [ ] `npm create vite@latest marketcorp -- --template react`
- [ ] Install Tailwind, port the existing `tailwind.config` (colors, spacing, fonts) from `index.html`
- [ ] Install `react-router-dom` (BrowserRouter), `@supabase/supabase-js`
- [ ] Folder layout:
  ```
  src/
    components/  (Header, Footer, ProductCard, Toast, AuthModal)
    pages/       (Landing, Catalog, ProductDetails, Cart)
    lib/         (supabase.js, api.js)
    hooks/       (useProducts, useCart, useAuth)
    context/     (CartContext, AuthContext)
  ```
- [ ] Port mock data from `index.html` to `src/lib/mockProducts.js` (temporary)
- [ ] Build the four pages as components; route via `<Routes>` (`/`, `/catalog`, `/product/:id`, `/cart`)
- [ ] Cart kept in `CartContext` + localStorage (no Supabase yet)
- [ ] Verify: every interaction from `index.html` works in the React version

**Deliverable:** React app at `localhost:5173` is feature-equivalent to `index.html`, still using mock data.

---

## Phase 2 — Supabase project + schema (Week 2)

**Goal:** Real backend exists and is queryable. No React wiring yet — verify everything from Postman first.

- [ ] Create Supabase project; copy URL + anon key + service role key
- [ ] Run schema in SQL editor (use the block from `index.html`):
  - `products` (id, name, category, price, sale_price, image_url, rating, stock, is_featured, created_at)
  - `cart_items` (user_id, product_id, quantity, updated_at) with composite PK
- [ ] Enable RLS on both tables; add policies (products = public read; cart_items = own rows only)
- [ ] Add indexes: `products(category)`, `products(created_at DESC)`, `cart_items(user_id)`
- [ ] Seed 12+ products: convert `MOCK_PRODUCTS` to INSERT statements, run in SQL editor
- [ ] Set up **Postman**:
  - Workspace: MarketCorp
  - Environment: `dev` with `SUPABASE_URL`, `ANON_KEY`, `SERVICE_KEY` variables
  - Collection: `products` folder with GET-all, GET-by-id, GET-by-category requests against `{{SUPABASE_URL}}/rest/v1/products`
  - Add `apikey` and `Authorization: Bearer {{ANON_KEY}}` to collection-level headers
- [ ] Run requests in Postman, confirm row shapes match the mock data shape

**Deliverable:** Live Supabase project with seeded data, Postman collection that hits every products endpoint successfully.

---

## Phase 3 — Products integration (Week 3)

**Goal:** React app reads products from Supabase. Mock data deleted.

- [ ] Add `.env.local` with `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`; commit `.env.example`
- [ ] `src/lib/supabase.js` exports a single client created from env vars
- [ ] `src/lib/api.js`:
  - `listProducts({ category, search, sort, minPrice, maxPrice })` → `.from('products').select('*')` with chained filters
  - `getProduct(id)`
  - `getFeatured()` → `.eq('is_featured', true)`
- [ ] `useProducts` hook: `useEffect` + state (`{ data, loading, error }`)
- [ ] Replace mock imports across Landing, Catalog, ProductDetails with the hook
- [ ] Loading skeletons on each page; error states with retry
- [ ] Catalog filters/search/sort: implement as Supabase query params (server-side filtering, not client-side)
- [ ] **Postman:**
  - Add tests in each request: `pm.test("status 200", ...)`, schema validation
  - Add a "Search" request demonstrating `?name=ilike.*chair*`
  - Add a "Sort + filter" request demonstrating `?category=eq.Audio&order=price.desc`
  - Run the collection with Newman: `newman run marketcorp.postman_collection.json -e dev.postman_environment.json`

**Deliverable:** Catalog, landing, and PDP pull live data from Supabase. Mock files deleted. Postman collection is green.

---

## Phase 4 — Auth integration (Week 4)

**Goal:** Email/password auth in React backed by Supabase Auth, verified via Postman.

- [ ] `AuthContext` exposes `{ user, loading, signIn, signUp, signOut }`
- [ ] On mount: `supabase.auth.getSession()`; subscribe to `onAuthStateChange`
- [ ] Port `AuthModal` from `index.html` to a `<AuthModal />` component using the context
- [ ] Header shows email when signed in; sign-out button
- [ ] Protected routing helper for future use (`<RequireAuth>`)
- [ ] **Postman auth flow:**
  - `POST {{SUPABASE_URL}}/auth/v1/signup` (body: email, password)
  - `POST {{SUPABASE_URL}}/auth/v1/token?grant_type=password`
  - Save returned `access_token` to environment variable via `pm.environment.set` in test script
  - Add a `{{ACCESS_TOKEN}}` variable; create an authed folder where requests use `Bearer {{ACCESS_TOKEN}}`
  - `POST /auth/v1/logout`
- [ ] Verify RLS: try to read another user's `cart_items` from Postman with the wrong token → expect 401/empty array

**Deliverable:** Real users can sign up and sign in. Postman has a working auth flow that captures tokens for downstream requests.

---

## Phase 5 — Cart integration + real-time (Week 5)

**Goal:** Cart syncs with Supabase for authed users; guest cart merges on sign-in.

- [ ] Refactor `CartContext`:
  - Guest mode: localStorage (existing behavior)
  - Authed mode: read/write `cart_items` table
  - On sign-in: merge guest cart with server cart, write merged result, clear localStorage
- [ ] `api.js` cart helpers: `loadCart(userId)`, `upsertCartItem(userId, productId, qty)`, `removeCartItem(userId, productId)`, `clearCart(userId)`
- [ ] Optimistic updates in cart UI (apply locally, rollback on error)
- [ ] Real-time stock subscription on PDP using `supabase.channel('products').on('postgres_changes', ...)` so an out-of-stock event updates the page live
- [ ] **Postman cart suite (uses `{{ACCESS_TOKEN}}`):**
  - `GET /rest/v1/cart_items?user_id=eq.{{USER_ID}}`
  - `POST /rest/v1/cart_items` (insert with `Prefer: resolution=merge-duplicates`)
  - `PATCH /rest/v1/cart_items?user_id=eq.{{USER_ID}}&product_id=eq.{{PRODUCT_ID}}`
  - `DELETE /rest/v1/cart_items?...`
  - Add a chained run: signup → add item → list → update qty → delete → confirm empty
- [ ] Run the chained flow with Newman; should pass clean

**Deliverable:** Cart is fully persistent and tied to user identity. End-to-end cart lifecycle is reproducible in Postman.

---

## Phase 6 — Hardening, docs, deploy (Week 6)

**Goal:** A second developer can clone the repo, follow the README, and have a working dev environment in under 15 minutes.

- [ ] Wrap all Supabase calls in try/catch with user-facing error messages
- [ ] Add a global ErrorBoundary
- [ ] Empty states for: no search results, empty cart, no orders (placeholder)
- [ ] Replace any remaining hardcoded strings with config
- [ ] **Postman polish:**
  - Pre-request scripts to refresh expired tokens
  - Test assertions on every request (status code, response shape, RLS expected behavior)
  - Export final collection + environment as JSON, commit to `postman/`
  - Add `npm run test:api` script that runs Newman against the dev env
- [ ] Frontend deploy to Vercel (free tier); set `VITE_SUPABASE_*` env vars in dashboard
- [ ] README sections to write:
  - Local setup (clone, env vars, `npm install`, `npm run dev`)
  - Supabase setup (project creation, SQL to run, seeding)
  - Postman usage (import, set env, run)
  - Architecture diagram (FE ↔ Supabase REST ↔ Postgres)
- [ ] Final smoke test: signup → browse → add to cart → reload → confirm cart persists

**Deliverable:** Repo is reproducible from a clean clone. Postman collection serves as both regression test and live API documentation.

---

## Out of scope (intentionally)

- Stripe/checkout
- Order history, account dashboard
- Admin panel
- Production launch, custom domain, monitoring
- Performance/SEO/a11y deep dives
- Email sending

These can come later. The deliverable here is a **clean integration** — frontend, backend, and an API testing layer that proves the contract between them.

## Weekly cadence

- **Mon:** review the week's checklist; cut anything tight
- **Wed:** mid-week sync — run Newman, check the collection still passes
- **Fri:** ship the week's work; tag commit `phase-N-complete`
- **Weekend:** off

## Risk register

| Risk | Mitigation |
|---|---|
| RLS policies block legitimate queries | Test every query in Postman with a real user token before wiring into React |
| Supabase free-tier project pauses after 7 days idle | Keep a Newman cron locally; or upgrade if active dev pauses |
| Tokens expire mid-session in Postman | Pre-request script refreshes via `/auth/v1/token?grant_type=refresh_token` |
| `.env.local` accidentally committed | `.gitignore` it from day one; use `.env.example` for shape |
| Vite + Tailwind CDN-to-build migration breaks styles | Port `tailwind.config` 1:1 in Phase 1 before touching components |
