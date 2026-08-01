# FootCarbonPrint — Functional Specification

> **Purpose of this document.** This is a complete, category-by-category inventory of **everything FootCarbonPrint does today**, written as **functional requirements**, **non-functional requirements**, and a description of the **design system as built**. It reflects the current implemented behavior of the app — not a future vision or redesign.

- **Product:** FootCarbonPrint — *"Know your footprint. Change your world."*
- **Platform:** Flutter (iOS · Android · Web). Currently deployed as a web app.
- **Current version:** 1.0.0+1
- **Languages supported:** English, Spanish, Portuguese, German.
- **Persistence:** Local-only (device storage / `SharedPreferences`), offline-first. No backend or account required today.

**Status legend used throughout:**
- ✅ **Implemented** — present and working in the current codebase.
- 🔶 **Partial** — a basic version exists; some part of the behavior is not wired up.

> This document lists only current functionality. Forward-looking/vision items are intentionally
> excluded; see the product `README.md` for the broader product vision and roadmap.

---

## 1. Product Overview

FootCarbonPrint is a **carbon-footprint self-diagnosis app** that turns everyday habits into awareness and concrete action. In under ~7 minutes a user answers a short, visual, swipe-and-tap test across six lifestyle categories. The app then computes an annual CO₂ estimate, translates it into emotional real-world equivalences, compares it against local and global benchmarks, and produces a **personalized action plan** ordered by real impact — framed around possibility, never guilt.

It layers **gamification** (points, levels, badges, weekly challenges), **progress tracking over time**, an **education guide**, a **carbon-offset calculator**, and **shareable result/profile cards** on top of the core diagnosis.

### 1.1 Value Proposition

| Problem | How FootCarbonPrint solves it |
|---|---|
| "I don't know how much I pollute." | Smart test in ≤7 minutes with intelligent default values. |
| "Environmental data is boring." | Visual, emotional equivalences ("= 70 trees / year"). |
| "I know I should change, but not where to start." | Action plan ranked by real impact and difficulty. |
| "I filled out a form once and forgot it." | Gamification, weekly challenges, and history tracking. |
| "I don't want to depend on connectivity." | Fully offline, local-first experience. |

### 1.2 Target Personas

| Persona | Motivation |
|---|---|
| Conscious urban youth | Wants to understand their impact without being an expert. |
| Busy professional | Prefers fast, visual answers. |
| Committed eco-user | Seeks goals, tracking, and community. |

---

## 2. Information Architecture & Primary Flow

### 2.1 Navigation Map

```
Splash (animated)
  └─ Onboarding (3 slides, skippable)   [first run only]
       └─ Main Shell  (bottom navigation, 3 tabs)
            ├─ Tab 1: Home            → Test Hub (modal) → 6 Test Modules → Results
            │                          → Learn Guide (modal)
            ├─ Tab 2: Dashboard       → Export Result (sheet)
            │                          → Profile / Eco Card (screen)
            └─ Tab 3: Action Plan
```

### 2.2 Primary User Flow

```
Welcome → Take the 6-module test → CO₂ calculation engine →
Results (footprint + level + comparison + achievements) →
Dashboard (breakdown, benchmarks, history, offset) →
Action Plan (top actions + commitments + challenges) →
Ongoing tracking, challenges & gamification → Share
```

### 2.3 Screen Inventory (as built)

| # | Screen | File | Role |
|---|---|---|---|
| 1 | Splash | `splash_screen.dart` | Animated brand intro + routing. |
| 2 | Onboarding | `splash_screen.dart` | 3-slide value intro. |
| 3 | Main Shell | `main_shell.dart` | Bottom-nav container (3 tabs). |
| 4 | Home | `home_screen.dart` | Level summary, achievements, weekly challenge, test progress. |
| 5 | Test Hub | `test_hub_screen.dart` | Grid of 6 modules + progress + learn banner. |
| 6 | Transport module | `modules/transport_module.dart` | Assessment inputs + live estimate. |
| 7 | Food module | `modules/food_module.dart` | Assessment inputs + live estimate. |
| 8 | Home/Energy module | `modules/home_module.dart` | Assessment inputs + live estimate. |
| 9 | Shopping module | `modules/shopping_module.dart` | Assessment inputs + live estimate. |
| 10 | Waste module | `modules/waste_module.dart` | Assessment inputs + live estimate. |
| 11 | Water module | `modules/water_module.dart` | Assessment inputs + live estimate. |
| 12 | Results | `results_screen.dart` | Full evaluation summary + confetti + share. |
| 13 | Dashboard | `dashboard_screen.dart` | Reports, charts, benchmarks, history, offset, export. |
| 14 | Action Plan | `action_plan_screen.dart` | Personalized actions + commitments + challenges. |
| 15 | Learn Guide | `learn_screen.dart` | 6-lesson educational carousel. |
| 16 | Profile / Eco Card | `profile_card_screen.dart` | Shareable identity card + PNG export. |

---

## 3. Functional Requirements

Requirements are grouped by functional category. Each has a stable ID (`FR-<area>.<n>`) for traceability.

### FR-1 — Onboarding & First-Run Experience

| ID | Requirement | Status |
|---|---|---|
| FR-1.1 | Show an animated splash screen (logo, tagline, fade + scale) on launch. | ✅ |
| FR-1.2 | Route first-time users to onboarding; returning users straight to the main shell. | ✅ |
| FR-1.3 | Present a 3-slide onboarding carousel introducing: (1) measure your planet impact, (2) visual dashboard, (3) achievements/gamification. | ✅ |
| FR-1.4 | Allow the user to skip onboarding at any slide. | ✅ |
| FR-1.5 | Persist an `onboarding_complete` flag so onboarding shows only once. | ✅ |
| FR-1.6 | Page indicator (animated dots) showing progress through the carousel. | ✅ |

### FR-2 — Assessment / Test Engine

| ID | Requirement | Status |
|---|---|---|
| FR-2.1 | Provide a **Test Hub** listing 6 independent modules as a 2-column card grid. | ✅ |
| FR-2.2 | Show each module's category weight (e.g. "28–35% of footprint") on its card. | ✅ |
| FR-2.3 | Display overall test completion (X/6 modules, % progress bar) in the hub and on Home. | ✅ |
| FR-2.4 | Mark a module as completed with a visual check state after it is saved. | ✅ |
| FR-2.5 | Allow modules to be completed in any order and independently. | ✅ |
| FR-2.6 | Allow the user to re-open and update any module at any time (re-take). | ✅ |
| FR-2.7 | **Transport module:** vehicle type (8 options), weekly km (slider), flights by range (short/medium/long counters). | ✅ |
| FR-2.8 | **Food module:** diet type, red-meat servings/week, local food, food waste. | ✅ |
| FR-2.9 | **Home/Energy module:** country selector (10 options: Colombia, US, Mexico, Brazil, Spain, Germany, Argentina, Chile, Peru, World — sets the electricity-grid factor), energy source, monthly kWh, household members, A/C usage hours. | ✅ |
| FR-2.10 | **Shopping module:** new clothing/month, electronics/year, online packages/month, second-hand habit. | ✅ |
| FR-2.11 | **Waste module:** separates recycling, composts, waste bags/week. | ✅ |
| FR-2.12 | **Water module:** average shower minutes, water temperature, garden watering. | ✅ |
| FR-2.13 | Use swipe/tap inputs (choice chips, sliders, +/- counters) — no free-text forms. | ✅ |
| FR-2.14 | Show a **live CO₂ estimate preview** inside each module that updates as inputs change. | ✅ |
| FR-2.15 | Provide intelligent default values so the test can be completed quickly. | ✅ |
| FR-2.16 | Auto-launch the Results screen the first time all 6 modules are complete. | ✅ |

### FR-3 — Calculation & Scoring Engine

| ID | Requirement | Status |
|---|---|---|
| FR-3.1 | Compute annual CO₂ (tCO₂/yr) per category from science-based emission factors (IPCC/EPA/GHG Protocol), with runtime country selection for the electricity-grid factor (9 countries + world-average fallback; Colombia default). | ✅ |
| FR-3.2 | Compute total annual CO₂ as the sum of all six categories. | ✅ |
| FR-3.3 | Produce a category breakdown map for charts and ranking. | ✅ |
| FR-3.4 | Classify the footprint into 5 levels (Champion → Conscious → On Track → High Impact → Critical) with emoji + color. | ✅ |
| FR-3.5 | Compute real-world equivalences: trees needed, light-bulb years, smartphone charges. | ✅ |
| FR-3.6 | Compute comparison against Paris target, Colombia average, and world average. | ✅ |
| FR-3.7 | Expose "below Paris target" and "% vs global average" flags. | ✅ |
| FR-3.8 | Keep emission factors data-driven and documented with scientific references. | ✅ |
| FR-3.9 | Region-adjustable emission factors selectable at runtime (country selector). | ✅ |

### FR-4 — Results & Evaluation

| ID | Requirement | Status |
|---|---|---|
| FR-4.1 | Present a dedicated Results screen after test completion with a celebratory animation (confetti). | ✅ |
| FR-4.2 | Show the total footprint value prominently with its level badge and color. | ✅ |
| FR-4.3 | Show a comparison card (You vs Paris vs Colombia vs World) as proportional bars. | ✅ |
| FR-4.4 | Show the **Top 3 emission sources** ranked, with per-category value and %. | ✅ |
| FR-4.5 | Show an **Achievements** card (points, level, earned/locked badges) inline in results. | ✅ |
| FR-4.6 | Provide CTAs to go to Dashboard, go to Action Plan, or Share the result. | ✅ |
| FR-4.7 | Allow re-viewing the Results screen later from the Test Hub. | ✅ |

### FR-5 — Dashboard & Reports

| ID | Requirement | Status |
|---|---|---|
| FR-5.1 | Show a header with the total footprint, level badge, and a color that reflects the level. | ✅ |
| FR-5.2 | **Equivalences report:** trees, bulb-years, phone charges as stat tiles. | ✅ |
| FR-5.3 | **Breakdown report:** interactive pie/donut chart of the 6 categories with legend and touch-to-expand. | ✅ |
| FR-5.4 | **Benchmark report:** horizontal bars for You vs Paris vs Colombia vs World. | ✅ |
| FR-5.5 | **History report:** trend over time (see FR-6). | ✅ |
| FR-5.6 | **Offset report:** carbon-offset calculator (see FR-11). | ✅ |
| FR-5.7 | Entry point to the shareable Profile/Eco Card. | ✅ |
| FR-5.8 | Entry point to Export Result as an image. | ✅ |
| FR-5.9 | Empty state guiding users to take the test when no data exists. | ✅ |
| FR-5.10 | Quick link from Dashboard to the Action Plan. | ✅ |

### FR-6 — History & Tracking

| ID | Requirement | Status |
|---|---|---|
| FR-6.1 | Record a footprint snapshot (date, total, breakdown) each time the user updates a module. | ✅ |
| FR-6.2 | De-duplicate snapshots to one per calendar day; cap history at 52 entries. | ✅ |
| FR-6.3 | Render a line chart of footprint over time once ≥2 snapshots exist. | ✅ |
| FR-6.4 | Show the delta vs the first measurement with "improved/worsened %" and color. | ✅ |
| FR-6.5 | Provide distinct empty / single-measurement / multi-measurement states. | ✅ |
| FR-6.6 | Show the count of measurements and the date range. | ✅ |

### FR-7 — Action Plan & Commitments

| ID | Requirement | Status |
|---|---|---|
| FR-7.1 | Generate a **personalized** action list computed from the user's own data (not a static list). | ✅ |
| FR-7.2 | Skip actions the user already performs (e.g. already recycles). | ✅ |
| FR-7.3 | Compute realistic CO₂ savings per action from the user's category values. | ✅ |
| FR-7.4 | Rank actions by potential savings and show the top ~6. | ✅ |
| FR-7.5 | Tag each action with its category, color, savings (−t), and description. | ✅ |
| FR-7.6 | Show a header summarizing total potential reduction and % of current footprint. | ✅ |
| FR-7.7 | Let the user **commit / un-commit** to an action (toggle), awarding points. | ✅ |
| FR-7.8 | Persist committed actions across sessions. | ✅ |
| FR-7.9 | Visually differentiate committed actions (border/fill + "+15 pts"). | ✅ |
| FR-7.10 | Empty state guiding users to take the test first. | ✅ |
| FR-7.11 | Real-time "emissions gauge" that drops as commitments are fulfilled. | 🔶 |

### FR-8 — Gamification: Points, Levels & Achievements

| ID | Requirement | Status |
|---|---|---|
| FR-8.1 | Compute **EcoPoints** from: modules completed, all-modules bonus, learn-guide completion, committed actions, challenges completed, low-footprint bonus. | ✅ |
| FR-8.2 | Define 5 **Eco Levels** (Beginner → Learner → Conscious → Activist → Eco-Champion) with emoji + color + point ranges. | ✅ |
| FR-8.3 | Show current level, points, progress bar to next level, and points remaining. | ✅ |
| FR-8.4 | Define 8 **badges** with earn conditions (first step, explorer, completionist, educated, conscious, light footprint, committed, activist). | ✅ |
| FR-8.5 | Compute earned vs locked badges dynamically; display both states (locked = dimmed). | ✅ |
| FR-8.6 | Show badge tooltips with name/description and an X/8 earned counter. | ✅ |
| FR-8.7 | Surface achievements on Home, in Results, and on the Eco Card. | ✅ |
| FR-8.8 | Home is intentionally gamification-first and shows **no CO₂ number**; the footprint value appears only in Results, Dashboard, the module previews, and the shareable cards. | ✅ |

### FR-9 — Weekly Challenges

| ID | Requirement | Status |
|---|---|---|
| FR-9.1 | Present a **weekly challenge** on Home that rotates automatically by week of year (4 challenges). | ✅ |
| FR-9.2 | Let the user mark the current challenge complete, awarding points. | ✅ |
| FR-9.3 | Persist completion per week period; show a completed state + "expires" hint. | ✅ |
| FR-9.4 | Show a challenges list in the Action Plan (with local, session-only check-off, distinct from the persisted Home weekly challenge). | ✅ |

### FR-10 — Education / Learn

| ID | Requirement | Status |
|---|---|---|
| FR-10.1 | Provide a 6-lesson swipeable educational guide (climate basics → greenhouse effect → footprints → categories → country comparison → actions). | ✅ |
| FR-10.2 | Each lesson has a title, body, a "fact" callout, and a custom animated/graphic visual. | ✅ |
| FR-10.3 | Show lesson progress (bar + n/total) and prev/next navigation. | ✅ |
| FR-10.4 | Mark the guide as completed on finish (awards a badge + points). | ✅ |
| FR-10.5 | Offer the guide from the Test Hub via a banner (different copy for first-time vs returning users). | ✅ |

### FR-11 — Carbon Offset

| ID | Requirement | Status |
|---|---|---|
| FR-11.1 | Calculate trees needed and estimated annual cost (USD + monthly) to neutralize the footprint. | ✅ |
| FR-11.2 | Show a "reduce first, then offset" warning to avoid greenwashing. | ✅ |
| FR-11.3 | Link out to certified offset platforms (Gold Standard, Pachama, atmosfair) + disclaimer. | ✅ |

### FR-12 — Sharing & Export

| ID | Requirement | Status |
|---|---|---|
| FR-12.1 | Share the result as text via the native/web share sheet (level + tCO₂ + link). | ✅ |
| FR-12.2 | Export the result as a branded **image card** (rendered off-screen, downloaded/shared as PNG). | ✅ |
| FR-12.3 | Generate and share a **Profile/Eco Card** image (see FR-13). | ✅ |
| FR-12.4 | Gracefully hide share options where the platform doesn't support it. | ✅ |
| FR-12.5 | The exported/shared result image uses a fixed light palette and hardcoded Spanish labels (Tú/Obj. París/Colombia/Mundo) regardless of the active theme or language. | 🔶 |

### FR-13 — Profile / Eco Identity Card

| ID | Requirement | Status |
|---|---|---|
| FR-13.1 | Render a shareable identity card: avatar, name, level badge, points, and stats (CO₂, X/6 modules, X/8 badges). | ✅ |
| FR-13.2 | Let the user add a photo (via image picker) or use a level emoji avatar. | ✅ |
| FR-13.3 | Style the card gradient by the user's level. | ✅ |
| FR-13.4 | Export/download/share the card as a high-resolution PNG. | ✅ |
| FR-13.5 | Custom decorative background (hex pattern) and brand footer. | ✅ |

### FR-14 — Personalization & Settings

| ID | Requirement | Status |
|---|---|---|
| FR-14.1 | Theme selector: System / Light / Dark, persisted. | ✅ |
| FR-14.2 | Set/edit the user's display name (used in greeting and Eco Card). | ✅ |
| FR-14.3 | Personalized greeting on Home (with or without name). | ✅ |
| FR-14.4 | Reset all data to start over (`resetAll` exists in the provider; no UI entry point is wired yet). | 🔶 |

### FR-15 — Data, Persistence & Privacy

| ID | Requirement | Status |
|---|---|---|
| FR-15.1 | Persist all user data locally (footprint, modules, commitments, history, challenges, name, theme). | ✅ |
| FR-15.2 | Work fully offline; no account or network required. | ✅ |
| FR-15.3 | Serialize/deserialize state safely with graceful fallback on corruption. | ✅ |

### FR-16 — Localization & Accessibility

| ID | Requirement | Status |
|---|---|---|
| FR-16.1 | Support English, Spanish, Portuguese, German with full string localization. | ✅ |
| FR-16.2 | Auto-select language from the device locale (among de/en/es/pt), falling back to English. Language is not user-selectable and is not persisted. | ✅ |
| FR-16.3 | Localize category names, level names, badge names/descriptions, and challenge copy. | ✅ |
| FR-16.4 | Accessibility baseline: semantic-friendly Material widgets, light/dark contrast; a full screen-reader/dynamic-text/contrast audit is not yet done. | 🔶 |

---

## 4. Non-Functional Requirements

### NFR-1 — Performance
- Cold start to interactive ≤ 3 s on mid-range devices; splash budget ~2.2 s.
- Test completion target: ≤ 7 minutes, ≤ ~35 total inputs.
- Live CO₂ preview recomputes instantly (< 16 ms frame budget; keep animations at 60 fps).
- Charts and image export must not block the UI thread (export runs off-frame).

### NFR-2 — Offline & Reliability
- 100% of core flows (test, results, dashboard, plan, gamification) work with no network.
- State reads/writes must never crash on malformed data (safe fallback to defaults).
- No data loss on app kill: persist immediately after each mutation.

### NFR-3 — Privacy & Security
- Privacy-first: no personal data leaves the device unless the user explicitly shares.
- Photos chosen for the Eco Card stay local and are only embedded in exports the user triggers.
- Any future cloud/account feature must be opt-in with clear consent and data-deletion controls.

### NFR-4 — Portability & Compatibility
- Single Flutter codebase targeting iOS, Android, and Web from one design system.
- Responsive layouts from small phones to large/web viewports; no horizontal overflow.
- Web build must degrade gracefully where native share/file APIs are unavailable.

### NFR-5 — Accessibility
- WCAG AA contrast for text and essential UI in both light and dark themes.
- Support OS dynamic text sizing without clipping; minimum 44×44 pt touch targets.
- Meaningful semantic labels for icons, charts, and interactive controls; never rely on color alone (pair color with icon/label — e.g. footprint levels).

### NFR-6 — Internationalization
- All user-facing strings localizable; no hard-coded copy in UI.
- Layouts tolerate ±30% string length variance across languages.
- Locale-aware number, date, and (future) currency formatting.

### NFR-7 — Maintainability & Scalability
- Emission factors and references are data-driven and centralized for update without code changes.
- Theming via a single palette/`ThemeExtension`; components read tokens, not literals.
- Content (lessons, challenges, actions) structured so new items can be added declaratively.

### NFR-8 — Usability & Content Tone
- Non-judgmental, possibility-focused language throughout.
- Progressive disclosure: smart defaults first, detail on demand.
- Consistent iconography and category color coding across every screen.

### NFR-9 — Quality & Observability
- Deterministic, testable calculation engine (pure functions per category), covered by
  unit + conformance tests in `test/carbon_footprint_test.dart` (per-category formulas,
  the beef-over-average model, per-country grid factors, and key factors pinned to
  official published values). CI runs `flutter analyze` and `flutter test --platform chrome`.
- Graceful empty, loading, single-item, and error states for every data-driven view.
- (Future) opt-in, privacy-respecting analytics for engagement/retention.

---

## 5. Design System (as built)

### 5.1 Brand & Visual Language
- **Identity:** nature-forward, optimistic, credible. Primary deep green `#1B5E20` → `#2E7D32`, secondary `#66BB6A`, soft background `#F1F8E9` (light).
- **Category color system (keep consistent everywhere):** Transport `#1565C0` · Food `#6A1B9A` · Home/Energy `#E65100` · Shopping `#00695C` · Waste `#4E342E` · Water `#0277BD`.
- **Footprint level scale:** Champion (green) · Conscious (blue) · On Track (yellow `#F9A825`) · High (orange `#E65100`) · Critical (red `#B71C1C`) — always paired with an emoji/icon so meaning isn't color-only.
- **Typography:** a clean, geometric sans (current: Inter). Big, confident numbers for the hero CO₂ value; strong weight contrast (w400 body → w800/w900 stats).
- **Theming:** full **light and dark** parity via design tokens; every surface, text, and category color has a dark variant.

### 5.2 Layout & Components
- Rounded, elevated **cards** (radius ~18–24) as the core content unit; generous padding.
- **Hero header** pattern (gradient, oversized number, level chip) for Results and Dashboard.
- **Stat tiles** for equivalences; **progress bars** and **donut chart** for breakdowns; **line chart** for history.
- Reusable **module scaffold** and **question card** so all six test modules feel identical.
- Consistent **bottom navigation** (Home · Footprint/Dashboard · Plan), with "?" nudge badges on the Footprint/Plan tabs until the user has data.

### 5.3 Interaction & Motion
- **Swipe & tap** inputs only — choice chips, sliders, +/- counters; no keyboards for the test.
- **Live feedback:** the CO₂ estimate updates as the user drags/taps.
- **Delight moments:** confetti on results, smooth level/gradient transitions, animated badges — used sparingly and skippable/respecting reduced-motion.
- **Emotional framing:** translate abstract tonnes into tangible equivalences and imagery.

### 5.4 UX Principles
| Principle | Implementation |
|---|---|
| Fast | ≤7 min, smart defaults, optional depth. |
| Visual | Sliders, icons, charts — minimal text entry. |
| Emotional | Real-world equivalences, not just numbers. |
| Non-judgmental | Possibility-oriented language. |
| Privacy-first | Local-first, explicit sharing only. |
| Accessible | Simple language, high contrast, scalable text. |
| Consistent | One color system + component kit across all screens. |

---

## 6. Traceability

Two-directional check: (A) every implemented capability in the code maps to a requirement, and (B) every requirement maps to a screen/behavior.

### 6.1 A → B: Code capability → Requirement

| Implemented capability (source) | Covered by |
|---|---|
| Splash + routing (`splash_screen.dart`) | FR-1.1, FR-1.2 |
| Onboarding carousel + skip + persistence | FR-1.3–FR-1.6 |
| Test Hub grid, weights, progress, completion marks | FR-2.1–FR-2.6 |
| 6 test modules with typed inputs | FR-2.7–FR-2.13 |
| Live CO₂ preview per module | FR-2.14 |
| Default values | FR-2.15 |
| Auto-open results at 6/6 (`test_hub_screen.dart`) | FR-2.16 |
| `CarbonFootprint` engine (`carbon_footprint.dart`) | FR-3.1–FR-3.8 |
| Emission factors + references (`core/constants/*`) | FR-3.8, NFR-7 |
| Results screen + confetti + cards + CTAs | FR-4.1–FR-4.7 |
| Dashboard header/equivalences/pie/benchmark/export | FR-5.1–FR-5.10 |
| Snapshot recording, dedup, cap, line chart, delta | FR-6.1–FR-6.6 |
| Personalized action builder + commit toggle | FR-7.1–FR-7.10 |
| `GamificationData` points/levels/badges | FR-8.1–FR-8.7 |
| Weekly challenge rotation + completion persistence | FR-9.1–FR-9.4 |
| 6-lesson Learn guide + completion | FR-10.1–FR-10.5 |
| Offset calculator + platforms + disclaimer | FR-11.1–FR-11.3 |
| Share text + export result image | FR-12.1, FR-12.2, FR-12.4 |
| Profile/Eco Card + photo + PNG export | FR-13.1–FR-13.5, FR-12.3 |
| Theme provider + name dialog + greeting | FR-14.1–FR-14.3 |
| `resetAll` in provider | FR-14.4 |
| `SharedPreferences` persistence + safe decode | FR-15.1–FR-15.3 |
| 4-language l10n + locale resolution | FR-16.1–FR-16.3 |

**Result:** No implemented capability is left undocumented. ✅

### 6.2 B → A: Requirement → Implementation status

- All FR items marked ✅ correspond to a concrete screen/behavior listed in §2.3 and §6.1.
- FR items marked 🔶 exist partially: `resetAll` without a UI entry (FR-14.4); the emissions gauge concept (FR-7.11); the fixed-palette/Spanish export image (FR-12.5); and the accessibility baseline (FR-16.4).

**Result:** Every requirement maps to current behavior; none is orphaned. ✅

---

## 7. Category Index (Quick Reference)

1. **Onboarding & First-Run** — FR-1
2. **Assessment / Test** — FR-2
3. **Calculation Engine** — FR-3
4. **Results & Evaluation** — FR-4
5. **Dashboard & Reports** — FR-5
6. **History & Tracking** — FR-6
7. **Action Plan & Commitments** — FR-7
8. **Gamification (Points/Levels/Achievements)** — FR-8
9. **Weekly Challenges** — FR-9
10. **Education / Learn** — FR-10
11. **Carbon Offset** — FR-11
12. **Sharing & Export** — FR-12
13. **Profile / Eco Card** — FR-13
14. **Personalization & Settings** — FR-14
15. **Data, Persistence & Privacy** — FR-15
16. **Localization & Accessibility** — FR-16

---

*End of specification.*
