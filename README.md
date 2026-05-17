# 🛒 Single Store E-Commerce Web Application

**Course:** AD350 H1 35267 — Full-Stack Integration Showcase
**Students:** Mark (makayo), Dara (DS-0277)
**Status:** Phase 5 — Frontend + Supabase Integration 🔄 In Progress
**Quarter Week:** 7 of 11

---

## 📌 Project Overview

This project is a single-store e-commerce web application built for a small business to demonstrate full-stack development with a focus on PostgreSQL database design and Supabase integration. It covers relational schema design, backend data operations, API testing with Postman, and a React frontend connected to a live database.

A customer visiting the store can browse products and add items to a cart. Behind the scenes, all data is stored and retrieved from a PostgreSQL database hosted on Supabase.

---

## 🧰 Tech Stack

| Layer | Tool | What it does |
|---|---|---|
| Frontend | React + Vite | Builds the UI the user sees and interacts with |
| Database | PostgreSQL (on Supabase) | Stores all app data (products, categories, cart) |
| Backend / API | Supabase (PostgREST) | Auto-generates REST API from PostgreSQL schema |
| API Testing | Postman | Tests all database operations before connecting to the UI |

---

## 🗺️ Project Roadmap — 6 Phases

| Quarter Week | Phase | Goal | Status |
|---|---|---|---|
| Week 5 | Phase 1 — Planning & Documentation | Define features, data structure, tech stack | ✅ Complete |
| Week 6 | Phase 2 — React + Vite Scaffold | Build core pages and navigation | ✅ Complete |
| Week 6 | Phase 3 — PostgreSQL Schema + Supabase | Database design and setup | ✅ Complete |
| Week 6 | Phase 4 — API Testing with Postman | Verify all endpoints return 200 OK | ✅ Complete |
| Week 7 | Phase 5 — Frontend + Supabase Integration | Connect UI to live database | 🔄 In Progress |
| Week 9 | Phase 6 — Testing & Final Showcase | YouTube + GitHub demo | 🔲 Pending |

---

## ✅ Phase 1 — Planning & Documentation

**What it is:** Plan the full project before writing a single line of code. Define the features, data structure, tech stack, and how all the pieces connect.

**Deliverables:**
- ✅ README.md — Planning & Documentation
- ✅ PDF artifact for submission
- ✅ Project approved by instructor

---

## ✅ Phase 2 — React + Vite Scaffold

**What it is:** Set up the React + Vite project structure. Build the core pages and navigation using mock data — no database yet.

**Core Pages:**

| Page | Description |
|---|---|
| / | Home — featured products and hero section |
| /catalog | Browse all products with filters and search |
| /catalog/:id | Single product detail page |

**Deliverables:**
- ✅ React project scaffolded with Vite
- ✅ All pages built and navigable via React Router
- ✅ Tailwind CSS configured with custom design tokens
- ✅ Navbar, Footer, and ProductCard components built

---

## ✅ Phase 3 — PostgreSQL Schema + Supabase

**What it is:** Design and create the relational database schema in PostgreSQL hosted on Supabase.

**Deliverables:**
- ✅ Products table schema with all required columns
- ✅ 12 sample products seeded across multiple categories
- ✅ Row-Level Security (RLS) disabled for public read access
- ✅ Supabase client configured via src/lib/supabase.js
- ✅ Environment variables set up via .env

---

## ✅ Phase 4 — API Testing with Postman

**What it is:** Write and test all database queries using Postman before connecting to the frontend.

**Endpoints Tested:**

| Request | Description |
|---|---|
| GET all products | Returns full product catalog |
| GET featured products | Returns products where is_featured = true |
| GET single product by ID | Returns one product |
| GET products by category | Filters by category |
| GET products on sale | Filters by sale_price |
| GET products by price range | Filters by min/max price |
| GET related products | Same category as a given product |
| GET products in stock | Filters by stock > 0 |

**Deliverables:**
- ✅ Postman workspace and environment configured
- ✅ Collection with 8 GET requests — all returning 200 OK
- ✅ RLS policies verified via Postman

---

## 🔄 Phase 5 — Frontend + Supabase Integration

**What it is:** Replace mock data with live Supabase data. Connect all pages to the PostgreSQL database.

**Deliverables:**
- 🔄 Supabase client connected to React frontend — Marky (#19)
- 🔄 Home page pulling live featured products — Marky (#20)
- 🔄 Catalog page with live filters and search — Dara (#21)
- 🔄 ProductDetail page fetching live product by ID — Dara (#22)
- 🔄 Mock data removed + loading and empty states added — Both (#23)

---

## 🔲 Phase 6 — Testing & Final Showcase

**What it is:** Test the full user journey end-to-end and record a showcase video.

**Deliverables:**
- 🔲 Full user flow tested — browse → view product → add to cart
- 🔲 Bug fixes from integration testing
- 🔲 GitHub repository cleaned up and documented
- 🔲 YouTube showcase video recorded

---

## 📂 Folder Structure

```
ecommerce-app/
├── public/
├── src/
│   ├── components/          # Navbar, Footer, ProductCard
│   ├── pages/               # Home, Catalog, ProductDetail
│   ├── lib/                 # Supabase client setup
│   ├── hooks/               # Custom React hooks
│   └── App.jsx
├── supabase/
│   ├── schema.sql           # Products table schema
│   ├── seed.sql             # 12 sample products
│   └── rls.sql              # Row Level Security config
├── .env                     # Environment variables (never commit)
├── .env.example             # Safe template
├── vite.config.js
└── README.md
```

---

## 🔑 Environment Variables

```
VITE_SUPABASE_URL=your-supabase-project-url
VITE_SUPABASE_ANON_KEY=your-supabase-anon-key
```

⚠️ Add `.env` to `.gitignore` — never push secrets to GitHub. Commit `.env.example` instead.

---

## 📚 Resources

| Resource | Link |
|---|---|
| Supabase Docs | https://supabase.com/docs |
| PostgreSQL Tutorial | https://www.postgresqltutorial.com |
| React Docs | https://react.dev |
| Vite Docs | https://vitejs.dev |
| Postman | https://www.postman.com |
