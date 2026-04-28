---
name: Professional Commerce Core
colors:
  surface: '#f7f9fb'
  surface-dim: '#d8dadc'
  surface-bright: '#f7f9fb'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f4f6'
  surface-container: '#eceef0'
  surface-container-high: '#e6e8ea'
  surface-container-highest: '#e0e3e5'
  on-surface: '#191c1e'
  on-surface-variant: '#45474c'
  inverse-surface: '#2d3133'
  inverse-on-surface: '#eff1f3'
  outline: '#75777d'
  outline-variant: '#c5c6cd'
  surface-tint: '#545f73'
  primary: '#091426'
  on-primary: '#ffffff'
  primary-container: '#1e293b'
  on-primary-container: '#8590a6'
  inverse-primary: '#bcc7de'
  secondary: '#4b41e1'
  on-secondary: '#ffffff'
  secondary-container: '#645efb'
  on-secondary-container: '#fffbff'
  tertiary: '#201100'
  on-tertiary: '#ffffff'
  tertiary-container: '#3c2300'
  on-tertiary-container: '#c88000'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d8e3fb'
  primary-fixed-dim: '#bcc7de'
  on-primary-fixed: '#111c2d'
  on-primary-fixed-variant: '#3c475a'
  secondary-fixed: '#e2dfff'
  secondary-fixed-dim: '#c3c0ff'
  on-secondary-fixed: '#0f0069'
  on-secondary-fixed-variant: '#3323cc'
  tertiary-fixed: '#ffddb8'
  tertiary-fixed-dim: '#ffb95f'
  on-tertiary-fixed: '#2a1700'
  on-tertiary-fixed-variant: '#653e00'
  background: '#f7f9fb'
  on-background: '#191c1e'
  surface-variant: '#e0e3e5'
typography:
  display-xl:
    fontFamily: Inter
    fontSize: 48px
    fontWeight: '700'
    lineHeight: '1.1'
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '600'
    lineHeight: '1.2'
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '600'
    lineHeight: '1.3'
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.5'
  label-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: '1'
    letterSpacing: 0.01em
  label-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: '1'
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  base: 4px
  xs: 0.5rem
  sm: 1rem
  md: 1.5rem
  lg: 2rem
  xl: 4rem
  gutter: 24px
  margin: 32px
  max_width: 1280px
---

## Brand & Style

The design system is anchored in a **Modern Corporate** aesthetic, prioritizing clarity, trust, and transactional efficiency. It targets a discerning consumer base that values ease of navigation over decorative flair. The interface utilizes generous whitespace and a rigorous grid to evoke a sense of organized professionalism.

The emotional response is one of reliability and calm. By stripping away unnecessary ornamentation, the design system allows product photography to remain the focal point while providing a stable, high-contrast framework for decision-making and checkout.

## Colors

This design system employs a sophisticated palette centered on **Slate (Primary)** for structural elements and typography to ensure an authoritative feel. **Indigo (Secondary)** serves as the functional accent for interactive elements like links and primary navigation.

A high-contrast **Amber (Tertiary)** is reserved exclusively for critical call-to-actions, such as "Add to Cart," to create a clear behavioral trigger. The background uses a tiered system of Whites and Cool Grays to separate product grids from utility bars without the need for heavy borders.

## Typography

The design system utilizes **Inter** exclusively to maintain a utilitarian and systematic appearance. The hierarchy is strictly enforced through weight changes rather than color shifts. 

Headlines use semi-bold weights with tighter letter spacing for a premium "editorial" feel in product titles. Body copy is optimized for readability with a generous 1.5x line height. Labels for category tags and price points use a medium weight to ensure they remain legible at smaller scales.

## Layout & Spacing

The design system follows a **Fixed Grid** model for desktop and a fluid model for mobile. It uses a 12-column system with a 24px gutter to provide ample "breathing room" between product listings.

Rhythm is maintained through an 8px base unit. Internal component padding (like within cards or buttons) should always be a multiple of 4px, while section-level vertical spacing should utilize the larger "xl" (64px) tokens to clearly demarcate different product categories or marketing blocks.

## Elevation & Depth

Visual hierarchy is achieved through **Tonal Layers** and **Ambient Shadows**. Instead of heavy lines, depth is created by placing white components (like product cards) on a subtle light-gray background (`#F8FAFC`).

Shadows must be "long and soft," using a low-opacity slate tint (`rgba(30, 41, 59, 0.08)`) to avoid a "dirty" look. Interactive elements should elevate slightly on hover—transitioning from a 4px blur to an 8px blur—to provide tactile feedback without breaking the minimalist aesthetic.

## Shapes

The design system uses a **Soft** shape language. This subtle rounding of corners (4px for small components, 8px for cards) bridges the gap between the strict geometry of traditional corporate design and the approachability of modern e-commerce.

Buttons and input fields utilize the standard 4px radius, while larger containers like modal overlays and hero sections can scale up to 12px. This consistency ensures that the UI feels cohesive and engineered rather than organic.

## Components

### Buttons
- **Primary:** Solid Indigo with white text for standard actions (e.g., "View Details").
- **CTA:** Solid Amber with dark slate text for the final conversion point ("Add to Cart").
- **Secondary:** Ghost style with a Slate border and no fill.

### Cards
Product cards are the core of this design system. They feature a white background, a very soft shadow, and no border. The product title should be in `headline-md` and the price in a high-contrast Slate `label-md`.

### Inputs & Filters
Search bars and category filters use a light gray fill (`#F1F5F9`) with no border in their default state, shifting to a white fill with an Indigo border on focus. This reduces visual noise in complex filter sidebars.

### Interactive Elements
- **Chips:** Used for category filtering; they should have a 100px border radius (pill-shaped) to distinguish them from square-ish product cards.
- **Checkboxes:** Square with a 2px radius, using Indigo for the checked state to maintain brand alignment.