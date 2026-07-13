# Health Tracker — Design System & Screen Specifications

**Version:** 1.0 · **Platform:** iOS (Flutter) · **Design language:** Apple native, Liquid Glass
**Accent:** Coral Red · **Typography:** SF Pro (system)
**Companion doc:** [[Health Tracker — Product & Functional Spec]] · [[Personal Med Log — Index]]

---

# Part A — Design System (Tokens)

All values are design tokens. Naming convention: `category.group.variant`. Units are logical points (pt) — identical to Flutter logical pixels. The whole system sits on a **4pt base grid**.

## A1. Color Tokens

### A1.1 Brand — Coral Red ramp
| Token | Light | Dark | Usage |
|---|---|---|---|
| `color.brand.primary` | `#FF5A4E` | `#FF6B5F` | Accent: buttons, active tab, links, selection, FAB |
| `color.brand.primaryPressed` | `#E64A3F` | `#FF8177` | Pressed/hover state of accent elements |
| `color.brand.tint12` | `#FF5A4E` @ 12% | `#FF6B5F` @ 16% | Soft coral fills (chips, selected rows, glow) |
| `color.brand.tint24` | `#FF5A4E` @ 24% | `#FF6B5F` @ 28% | Progress track fill, emphasis backgrounds |
| `color.brand.onPrimary` | `#FFFFFF` | `#FFFFFF` | Text/icons placed on solid coral |

> Coral is the *identity* color. SOS uses a separate, hotter red (below) so emergencies never blend with ordinary accent UI.

### A1.2 Semantic status
| Token | Light | Dark | Usage |
|---|---|---|---|
| `color.status.sos` | `#D70015` | `#FF453A` | SOS badge, SOS card border/label (Apple systemRed family) |
| `color.status.sosBg` | `#D70015` @ 10% | `#FF453A` @ 18% | SOS card fill tint over glass |
| `color.status.success` | `#34C759` | `#30D158` | Taken checkmark, adherence-good |
| `color.status.warning` | `#FF9F0A` | `#FFD60A` | Overdue dose, low stock |
| `color.status.info` | `#007AFF` | `#0A84FF` | Informational banners only |

### A1.3 Neutrals & surfaces (Apple system palette)
| Token | Light | Dark | Usage |
|---|---|---|---|
| `color.bg.base` | `#F2F2F7` | `#000000` | Screen background (systemGroupedBackground) |
| `color.bg.elevated` | `#FFFFFF` | `#1C1C1E` | Opaque cards, sheets |
| `color.bg.secondary` | `#FFFFFF` | `#2C2C2E` | Grouped list cells |
| `color.fill.tertiary` | `#767680` @ 12% | `#767680` @ 24% | Input fields, segmented control track |
| `color.separator` | `#3C3C43` @ 29% | `#545458` @ 60% | Hairline dividers (0.5 pt) |
| `color.text.primary` | `#000000` | `#FFFFFF` | Titles, values |
| `color.text.secondary` | `#3C3C43` @ 60% | `#EBEBF5` @ 60% | Subtitles, instructions |
| `color.text.tertiary` | `#3C3C43` @ 30% | `#EBEBF5` @ 30% | Placeholders, timestamps |

### A1.4 Liquid Glass material tokens
Liquid Glass = translucent, blurred, softly refractive surfaces that sit *over* content and take on its color. Tokenize the recipe, not just a color:

| Token | Value (Light) | Value (Dark) |
|---|---|---|
| `glass.regular.fill` | `#FFFFFF` @ 55% | `#1C1C1E` @ 55% |
| `glass.regular.blur` | 24 (sigma) | 24 |
| `glass.regular.saturation` | 1.8× | 1.8× |
| `glass.regular.borderHighlight` | `#FFFFFF` @ 35%, 1 pt, top edge | `#FFFFFF` @ 12% |
| `glass.regular.shadow` | `#000000` @ 8%, y 8, blur 24 | `#000000` @ 45%, y 8, blur 24 |
| `glass.thin.fill` | `#FFFFFF` @ 35% | `#1C1C1E` @ 40% |
| `glass.thin.blur` | 16 | 16 |
| `glass.sos.fill` | `glass.regular.fill` + `color.status.sosBg` overlay | same |

**Where glass is used:** navigation bar, tab bar, SOS strip, floating action cluster, dose "Next up" card, modal sheet chrome. **Where it is not:** long scrolling list cells (use `color.bg.secondary` — glass everywhere kills legibility and battery).

Flutter recipe: `ClipRRect` → `BackdropFilter(ImageFilter.blur(sigmaX: token, sigmaY: token))` → container with `fill` color → 1 pt top inner highlight border → drop shadow. Wrap once as a `GlassSurface` widget so every usage stays identical.

## A2. Typography Tokens — SF Pro

Use the system font (SF Pro renders automatically on iOS; in Flutter set `fontFamily: 'CupertinoSystemText'` / use Cupertino defaults). Scale mirrors Apple's HIG text styles. All support Dynamic Type.

| Token | Style | Size / Line height | Weight | Usage |
|---|---|---|---|---|
| `type.largeTitle` | Large Title | 34 / 41 | Bold | Screen title (Home greeting, tab roots) |
| `type.title1` | Title 1 | 28 / 34 | Bold | Section heroes, vitals big number context |
| `type.title2` | Title 2 | 22 / 28 | Bold | Sheet titles, record detail title |
| `type.title3` | Title 3 | 20 / 25 | Semibold | Card group headers |
| `type.headline` | Headline | 17 / 22 | Semibold | Medication name on dose card |
| `type.body` | Body | 17 / 22 | Regular | Default text, form values |
| `type.callout` | Callout | 16 / 21 | Regular | Secondary card text |
| `type.subheadline` | Subheadline | 15 / 20 | Regular | Dose instructions, metadata rows |
| `type.footnote` | Footnote | 13 / 18 | Regular | Timestamps, helper text |
| `type.caption1` | Caption 1 | 12 / 16 | Regular | Badges, chart axis labels |
| `type.caption2` | Caption 2 | 11 / 13 | Semibold | SOS badge text (tracked +0.6) |
| `type.numeric` | SF Pro Rounded | 40 / 44 | Bold, tabular figures | Vital values (120/80), countdowns |

Rules: never mix weights inside one label; numbers in logs/charts always use tabular (monospaced) figures; coral text on white must be ≥ 15 pt or Semibold to hold contrast.

## A3. Spacing, Radius, Layout Tokens

### A3.1 Spacing scale (4pt grid)
| Token | Value | Typical use |
|---|---|---|
| `space.1` | 4 | Icon-to-label gap inside badges |
| `space.2` | 8 | Gap between title and subtitle in a card |
| `space.3` | 12 | Inner padding of chips; gap between SOS cards |
| `space.4` | 16 | **Default screen horizontal margin**; card inner padding |
| `space.5` | 20 | Card inner padding (large cards) |
| `space.6` | 24 | Gap between sections |
| `space.8` | 32 | Gap above section headers, hero spacing |
| `space.10` | 40 | Empty-state vertical rhythm |

### A3.2 Radius & stroke
| Token | Value | Usage |
|---|---|---|
| `radius.s` | 10 | Chips, segmented controls, thumbnails |
| `radius.m` | 16 | Standard cards, input fields |
| `radius.l` | 24 | Glass panels, SOS cards, sheets' top corners |
| `radius.pill` | 999 | Buttons, badges, FAB cluster |
| `stroke.hairline` | 0.5 | Separators |
| `stroke.glassEdge` | 1 | Glass top highlight |

### A3.3 Layout constants
| Token | Value |
|---|---|
| `layout.margin` | 16 (screen edge, both sides) |
| `layout.gutter` | 12 (between grid items) |
| `layout.listGap` | 8 (between cards in a vertical list) |
| `layout.minTap` | 44 × 44 (Apple minimum touch target) |
| `layout.navBarHeight` | 44 (+ safe area), large-title expands to 96 |
| `layout.tabBarHeight` | 49 (+ home indicator safe area) |

## A4. Elevation, Motion, Haptics

| Token | Value |
|---|---|
| `elevation.card` | shadow `#000` @ 6%, y 2, blur 8 |
| `elevation.glass` | see `glass.regular.shadow` |
| `motion.quick` | 200 ms, curve `easeOutCubic` — state changes (Take button → check) |
| `motion.standard` | 300 ms, `easeInOutCubic` — sheet present, card expand |
| `motion.spring` | stiffness 220, damping 26 — SOS strip bounce-in, FAB cluster |
| `motion.reduced` | honor iOS Reduce Motion: replace springs/slides with 150 ms fades |
| `haptic.take` | `.success` notification haptic on dose taken |
| `haptic.sos` | `.warning` on SOS log; `.heavy` impact on limit warning |

## A5. Core Components

### `GlassSurface`
Base container implementing A1.4. Props: `material` (regular/thin/sos), `radius` (default `radius.l`).

### `DoseCard`
- Container: `color.bg.secondary`, `radius.m`, padding `space.4`, list gap `layout.listGap`.
- Left: 40×40 medication icon tile (`radius.s`, `color.brand.tint12` bg, coral SF Symbol `pills.fill`).
- Middle (gap `space.3` from icon): name `type.headline` / `text.primary`; instruction `type.subheadline` / `text.secondary`, `space.1` below.
- Right: time `type.subheadline` tabular; below it the **Take** control.
- Take button: pill, height 32, horizontal padding `space.4`, `color.brand.primary` fill, label `type.footnote` Semibold `onPrimary`. Taken state → transparent fill, coral `checkmark.circle.fill` 22 pt + "Taken 8:05" `type.footnote` `text.tertiary`.
- Overdue variant: 3 pt leading edge bar `color.status.warning`, time label switches to warning color.
- Next-up variant: rendered on `GlassSurface(regular)`, `radius.l`, padding `space.5`, plus countdown line `type.footnote` in coral.

### `SOSCard`
- `GlassSurface(sos)`, `radius.l`, width 240, height 88, padding `space.4`, gap between cards `space.3`.
- Top row: SOS badge — pill, `color.status.sos` fill, text "SOS" `type.caption2` white, padding 4×8; icon `bolt.heart.fill` 16 pt white inside badge, gap `space.1`.
- Name `type.headline`; rule line ("Max 3/day · 4 h gap") `type.caption1` `text.secondary`.
- Right-aligned **Taken now** button: pill, height 36, `color.status.sos` fill, white label — never coral, SOS is always the hot red.

### `VitalTile`, `RecordThumb`, `PrimaryButton`, `FieldRow`
- `PrimaryButton`: height 50, `radius.pill`, coral fill, label `type.body` Semibold white, disabled = `fill.tertiary` + `text.tertiary`.
- `FieldRow` (forms): height 52, bg `color.bg.secondary`, label `type.body`, value/input right-aligned `type.body` `text.secondary`, horizontal padding `space.4`, hairline separator inset 16 from left.
- `RecordThumb`: 1:1.3 thumbnail, `radius.s`, type-badge chip overlaid bottom-left (padding 4×8, `glass.thin`).
- `VitalTile`: `color.bg.secondary`, `radius.m`, padding `space.4`; metric label `type.footnote` `text.secondary`; value `type.numeric` 28 pt; unit `type.caption1` baseline-aligned, `space.1` gap.

---

# Part B — Screen Specifications

Every screen: background `color.bg.base`, horizontal margin `layout.margin` (16), respects safe areas, Dynamic Type enabled. Nav bar and tab bar are always `GlassSurface(regular)` edge-to-edge with hairline bottom/top separator at `color.separator`.

Global tab bar (49 pt + safe area): Home `house.fill` · Records `folder.fill` · Log `plus.circle.fill` (center, coral, 44 pt raised) · Vitals `waveform.path.ecg` · Settings `gearshape.fill`. Active tint `color.brand.primary`, inactive `text.tertiary`, labels `type.caption2`.

---

## B1. Home — Medication Schedule

**Purpose:** answer "what's next?" in one glance; keep SOS reachable at all times.

```
┌──────────────────────────────────────┐
│ (glass nav) Mon, Jul 13     [avatar] │  large title area
│ Good morning, Sam                    │  type.largeTitle
├──────────────────────────────────────┤
│ SOS  ▷ [SOSCard][SOSCard] →          │  pinned glass strip
├──────────────────────────────────────┤
│ NEXT UP                              │  section header
│ ┌─ glass card ────────────────────┐  │
│ │ 💊 Metformin 500mg   1:00 PM    │  │
│ │ 1 tablet · after food           │  │
│ │ in 45 min            [ Take ]   │  │
│ └─────────────────────────────────┘  │
│ LATER TODAY                          │
│ [DoseCard]                           │
│ [DoseCard]                           │
│ COMPLETED (2) ⌄                      │  collapsed
└──────────────────────────────────────┘
│ (glass tab bar)                      │
```

**Measurements**
- Nav/greeting block: date `type.subheadline` `text.secondary`; greeting `type.largeTitle`; `space.2` between them; `space.4` below block.
- **SOS strip (pinned):** sits directly under the nav bar as a sticky header — it does not scroll away. Horizontal scroll, content inset 16, card gap `space.3`, strip vertical padding `space.3` top and bottom. Strip background: none (cards are individually glass) so the list is visible sliding beneath. Section label "SOS" `type.caption1` Semibold in `color.status.sos`, 16 left inset, `space.2` above cards. Hidden entirely if no SOS meds exist.
- Section headers ("NEXT UP", "LATER TODAY"): `type.footnote` Semibold, uppercase, tracked +0.5, `text.secondary`; `space.6` above, `space.2` below.
- Next-up card: `DoseCard` next-up variant (glass, padding `space.5`), full width.
- Later list: standard `DoseCard`s, gap `layout.listGap` (8).
- Overdue section (when present) appears *above* Next up, header in `color.status.warning`.
- Completed: collapsed disclosure row, height 44, chevron `text.tertiary`; expanded cells at 60% opacity with coral checkmarks.
- Last scroll content bottom padding: 96 (clears tab bar).

**Color/type summary:** coral only on Take buttons, countdown text, active tab; SOS strip is the only hot-red element; everything else neutral — the screen should read calm with two clear temperature signals.

**Empty state:** icon `pills` 56 pt `text.tertiary`, title `type.title3` "No medications yet", body `type.subheadline` `text.secondary`, `PrimaryButton` "Add medication", vertical rhythm `space.10` / `space.2` / `space.6`.

---

## B2. Records — Library

**Purpose:** browse/search the document archive.

- Nav: large title "Records", trailing `plus` button (coral, 22 pt). Search field pinned under title: height 36, `color.fill.tertiary`, `radius.s`, placeholder `type.body` `text.tertiary`.
- Filter chip row under search: horizontal scroll, chips height 32, `radius.pill`, padding 6×12, gap `space.2`; default `fill.tertiary` + `text.primary`; selected `color.brand.tint12` bg + coral label; leading chip "All", then Prescription / Scan / Blood work / Doctor ▾ / Date ▾. Row vertical padding `space.3`.
- Grid: 2 columns, gutter `layout.gutter` (12), row gap `space.4`. Cell = `RecordThumb` + below it: title `type.subheadline` Semibold (1 line), then "Dr. Rao · Cardiology" `type.caption1` `text.secondary`, then date `type.caption1` `text.tertiary`; `space.1` between lines, `space.2` under image.
- Month section headers between groups: `type.title3`, `space.6` above / `space.3` below.

## B3. Add Record (modal sheet)

- Presented as sheet: top corners `radius.l`, grabber 36×5 `fill.tertiary`, background `color.bg.base`; nav row: "Cancel" (coral text) · "New Record" `type.headline` · "Save" (coral Semibold, disabled until image + date valid).
- Capture zone (top): height 180, dashed 1 pt border `color.separator`, `radius.m`, centered `camera.fill` 32 pt coral + "Take photo or import" `type.subheadline` `text.secondary`. After capture → horizontal thumbnail strip (thumbs 72×72, `radius.s`, gap `space.2`, trailing "+" tile).
- Form (grouped list, `space.6` below capture): `FieldRow`s — Date (defaults today, wheel picker) · Type (segmented: Prescription/Scan/Blood/Other) · Doctor (pushes searchable picker with "Add doctor" row) · Speciality (auto-filled chip, coral tint bg; editable) · Title · Notes (multiline, min height 88).
- Rows grouped in one `radius.m` card, hairline separators inset 16; group separated from capture zone by `space.6`.
- Speciality row is emphasized (label Semibold) when Type = Prescription, matching the requirement.

## B4. Record Detail

- Full-bleed image viewer top (pinch-zoom, page dots `type.caption2` if multi-page), height 55% of viewport; glass back button 36 pt circle top-left.
- Metadata panel slides over image bottom: `GlassSurface(regular)`, top corners `radius.l`, padding `space.5`; title `type.title2`; rows (icon 20 pt coral + label `type.subheadline`): date, doctor, speciality, tags; row height 36.
- Action row at bottom: Share / Edit / Delete — 3 equal glass-thin pills height 44, gap `space.3`; Delete label `color.status.sos`, confirm via native alert.

---

## B5. Medication Add / Edit

- Sheet like B3. Sections (each a grouped card, `space.6` between):
  1. **Identity:** Name · Strength · Form (segmented).
  2. **Schedule:** "SOS / emergency medication" toggle (coral). OFF → frequency picker (times/day, interval, weekdays) + time rows (44 pt each, wheel per row, "+ Add time" in coral). ON → schedule section swaps (200 ms crossfade) to: Max per day (stepper) · Minimum gap (wheel, hours).
  3. **Details:** Instructions · Duration · Stock count + low-stock toggle · Link prescription (record picker) · Prescribing doctor.
- SOS toggle ON also shows a preview `SOSCard` inline so users see exactly what will pin to Home.

## B6. Log (center tab) — Quick Logger

- Opens as sheet with two big glass tiles side by side (height 120, gap `space.3`): "Log vital" `waveform.path.ecg` · "Add record" `camera.fill`; icons 32 pt coral, labels `type.headline`; below: "Recent" list of last 5 log entries (rows 52 pt).
- **Vital entry flow:** vital picker grid (2-col `VitalTile`s) → entry screen: giant value input `type.numeric` 40 pt centered, unit chip beside, custom decimal pad below; BP shows two fields "SYS / DIA" with pulse optional; glucose shows context segmented (Fasting/Post-meal/Random); timestamp row (defaults now, editable) `type.footnote`; `PrimaryButton` Save pinned above keyboard. Target ≤ 10 s.

## B7. Vitals — History & Trends

- Large title "Vitals". Summary grid: 2-col `VitalTile`s showing latest value + trend arrow (up/down in success/warning, contextual per metric), gutter 12, row gap 12.
- Tapping a tile → detail: range segmented control (7d/30d/90d/custom) height 32 `space.4` below nav; chart card `color.bg.elevated` `radius.m` padding `space.5`, height 240 — line 2 pt coral, gradient fill coral @ 20%→0%, reference band `fill.tertiary` with `type.caption1` label "typical range — general reference, not medical advice"; axis labels `type.caption1` tabular `text.tertiary`; selected-point lollipop with glass tooltip.
- Below chart: entries list (rows 52 pt: value `type.body` tabular · context chip · timestamp `type.footnote`), swipe-to-delete.
- **Adherence card** on Vitals root, full width under grid: "This week 92%" `type.title1` + 7-dot day row (10 pt dots: success/warning/`fill.tertiary`), padding `space.5`.

## B8. Settings

Grouped `FieldRow` lists: Profile · Notifications (grace window, escalation) · App Lock (Face ID toggle — coral) · Units (mg/dL–mmol/L, kg–lb) · Export data · About. Section gap `space.6`. Destructive "Delete all data" row label in `color.status.sos` at bottom.

---

# Part C — Flutter Implementation Notes

- **App shell:** `CupertinoApp` (or MaterialApp with Cupertino behaviors) — system font is SF automatically on iOS; do not bundle SF font files (Apple licensing — the system provides it).
- **Tokens in code:** one `DesignTokens` file mirroring Part A exactly (`AppColors`, `AppType`, `AppSpace`, `AppRadius`, `Glass`); no raw hex/pt values anywhere in widgets. Light/dark resolved via `CupertinoDynamicColor`.
- **Glass:** single `GlassSurface` widget (ClipRRect → BackdropFilter blur → tinted fill → top highlight → shadow). Add `saturation` via `ColorFilter.matrix`. Limit to ≤ 4 glass layers per screen for GPU headroom on older iPhones.
- **SOS pinned strip:** `SliverPersistentHeader(pinned: true)` inside the Home `CustomScrollView`.
- **Charts:** `fl_chart` or `CustomPaint`; enforce tabular figures with `FontFeature.tabularFigures()`.
- **Haptics:** `HapticFeedback` mapped to A4 tokens.
- **Accessibility floor:** every token pair ≥ WCAG AA at its assigned size; SOS carries badge + icon (not color alone); all tap targets ≥ 44 pt; test at Dynamic Type XL — cards grow, never truncate dose instructions.

# Part D — Token JSON (source of truth)

Keep this as `tokens.json` in the repo; generate the Dart tokens file from it so design and code never drift.

```json
{
  "color": {
    "brand": { "primary": {"light": "#FF5A4E", "dark": "#FF6B5F"},
               "primaryPressed": {"light": "#E64A3F", "dark": "#FF8177"},
               "onPrimary": "#FFFFFF" },
    "status": { "sos": {"light": "#D70015", "dark": "#FF453A"},
                "success": {"light": "#34C759", "dark": "#30D158"},
                "warning": {"light": "#FF9F0A", "dark": "#FFD60A"} },
    "bg": { "base": {"light": "#F2F2F7", "dark": "#000000"},
            "elevated": {"light": "#FFFFFF", "dark": "#1C1C1E"},
            "secondary": {"light": "#FFFFFF", "dark": "#2C2C2E"} }
  },
  "space": { "1": 4, "2": 8, "3": 12, "4": 16, "5": 20, "6": 24, "8": 32, "10": 40 },
  "radius": { "s": 10, "m": 16, "l": 24, "pill": 999 },
  "glass": { "regular": { "blur": 24, "fillOpacityLight": 0.55, "fillOpacityDark": 0.55, "saturation": 1.8 },
             "thin": { "blur": 16, "fillOpacityLight": 0.35, "fillOpacityDark": 0.40 } },
  "motion": { "quick": 200, "standard": 300 }
}
```
