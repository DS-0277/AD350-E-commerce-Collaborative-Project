# 🛒 Single Store E-Commerce Web Application

> **Course Assignment** — AD350 H1 35267 — Full-Stack Integration Showcase  
> **Students:** Mark (makayo), Dara (DS-0277)  
> **Status:** Phase 1 — Planning & Documentation ✅  
> **Quarter Week:** 4 of 11 — Starting Phase 1 Development

---

## 📌 Project Overview

This project is a single-store e-commerce web application built for a small business to demonstrate full-stack development with a focus on **PostgreSQL database design** and **Supabase integration**. It covers relational schema design, backend data operations, API testing with Postman, and a React frontend connected to a live database.

A customer visiting the store can browse products and add items to a cart. Behind the scenes, all data is stored and retrieved from a PostgreSQL database hosted on Supabase.

---

## 🧰 Tech Stack

| Layer | Tool | What it does |
|---|---|---|
| **Frontend** | React + Vite | Builds the UI the user sees and interacts with |
| **Database** | PostgreSQL (on Supabase) | Stores all app data (products, categories, cart) |
| **Backend / API** | Supabase (PostgREST) | Auto-generates REST API from PostgreSQL schema |
| **API Testing** | Postman | Tests all database operations before connecting to the UI |

---

## 🗺️ Project Roadmap — 6 Phases

| Quarter Week | Phase | Goal |
|---|---|---|
| Week 4 | Phase 1 — Planning & Documentation | ✅ Complete |
| Week 5 | Phase 2 — React + Vite Scaffold | Start development |
| Week 6 | Phase 3 — PostgreSQL Schema + Supabase | Database design |
| Week 7 | Phase 4 — API Testing with Postman | CRUD operations |
| Week 8 | Phase 5 — Frontend + Supabase Integration | Connect UI to database |
| Week 9 | Phase 6 — Testing & Final Showcase | YouTube + GitHub demo |

---

### ✅ Phase 1 — Planning & Documentation

**What it is:** Plan the full project before writing a single line of code. Define the features, data structure, tech stack, and how all the pieces connect.

**Deliverables:**
- [x] `README.md` — Planning & Documentation
- [x] PDF artifact for submission
- [x] Project approved by instructor

---

### 🔲 Phase 2 — React + Vite Scaffold

**What it is:** Set up the React + Vite project structure. Build the core pages and navigation using mock data — no database yet.

**Core Pages:**

| Page | Description |
|---|---|
| `/` | Home — featured products or welcome banner |
| `/products` | Browse all products |
| `/products/:id` | Single product detail page |
| `/cart` | View and edit cart items |

**Deliverables:**
- [ ] React project scaffolded with Vite
- [ ] All pages built and navigable via React Router
- [ ] Mock product data wired to UI
- [ ] Tailwind CSS configured

---

### 🔲 Phase 3 — PostgreSQL Schema + Supabase

**What it is:** Design and create the relational database schema in PostgreSQL hosted on Supabase. This is the core focus of the course — defining the shape of the data, how tables relate to each other, and ensuring data integrity through proper schema design.

**Core Tables:**

| Table | Purpose |
|---|---|
| `products` | Items available for purchase |
| `categories` | Groups of products (e.g. "Clothing", "Electronics") |
| `cart_items` | Products a customer has added to their cart |

**Deliverables:**
- [ ] SQL file with `CREATE TABLE` statements
- [ ] Schema diagram — visual map of how tables connect
- [ ] Row-Level Security (RLS) policies configured in Supabase
- [ ] Tables created and seeded inside Supabase dashboard

---

### 🔲 Phase 4 — API Testing with Postman

**What it is:** Write and test all database queries using Postman before connecting to the frontend. Supabase exposes PostgreSQL as a REST API via PostgREST, meaning you can send HTTP requests to read or change data without writing a traditional backend server.

**Operations to test (CRUD):**

| Operation | Example |
|---|---|
| **C**reate | Add a new product to the `products` table |
| **R**ead | Get a list of all products |
| **U**pdate | Change a product's price |
| **D**elete | Remove a product |

**Deliverables:**
- [ ] Postman workspace and environment configured (`SUPABASE_URL`, `ANON_KEY`)
- [ ] Postman collection with saved requests for each table
- [ ] Screenshots of successful API responses
- [ ] RLS policies verified via Postman

---

### 🔲 Phase 5 — Frontend + Supabase Integration

**What it is:** Replace mock data with live Supabase data. Connect all pages to the PostgreSQL database so the frontend is fully powered by real data.

**Features to implement:**
- Products page pulls live data from Supabase
- Product detail page fetches a single product by ID
- Cart reads and writes to the `cart_items` table
- Filters and search powered by Supabase queries

**Deliverables:**
- [ ] Supabase client connected to React frontend
- [ ] All pages pulling live data from the database
- [ ] Cart persists via Supabase `cart_items` table
- [ ] Mock data deleted

---

### 🔲 Phase 6 — Testing & Final Showcase

**What it is:** Test the full user journey end-to-end and record a showcase video demonstrating the completed application.

**Deliverables:**
- [ ] Full user flow tested — browse → view product → add to cart → view cart
- [ ] Bug fixes from integration testing
- [ ] GitHub repository cleaned up and documented
- [ ] YouTube showcase video recorded demonstrating:
  - Live Supabase database connection
  - CRUD operations via Postman
  - Frontend pulling real data from PostgreSQL
  - Cart functionality working end-to-end

---

## 📂 Planned Folder Structure

```
ecommerce-app/
├── public/                  # Static assets (favicon, images)
├── src/
│   ├── components/          # Reusable UI pieces (Navbar, ProductCard, etc.)
│   ├── pages/               # Full page components (Home, Products, Cart, etc.)
│   ├── lib/                 # Supabase client setup
│   ├── hooks/               # Custom React hooks
│   └── App.jsx              # Root component with routes
├── .env                     # Environment variables (Supabase keys — never commit this!)
├── .env.example             # Safe template for environment variables
├── index.html
├── vite.config.js
└── README.md                # This file
```
---
## 🔑 Environment Variables

When connecting the frontend to Supabase, you will need two secret keys. These go in a `.env` file and are **never shared publicly**.


```
VITE_SUPABASE_URL=your-supabase-project-url
VITE_SUPABASE_ANON_KEY=your-supabase-anon-key
```

> ⚠️ Add `.env` to your `.gitignore` file so it is never accidentally pushed to GitHub. Commit `.env.example` instead.

---

## 📚 Resources

| Resource | Link |
|---|---|
| Supabase Docs | https://supabase.com/docs |
| PostgreSQL Tutorial | https://www.postgresqltutorial.com |
| React Docs | https://react.dev |
| Vite Docs | https://vitejs.dev |
| Postman | https://www.postman.com |

---
