# MedLog — Personal Med Log

Personal health tracker: medication schedule with pinned SOS/emergency meds, a photo archive for medical records (prescriptions, scans, blood work), and medication + vitals logging with trends.

**Stack:** Flutter (iOS-first) · Cupertino / Liquid Glass design language · SF Pro · Firebase (`medlog-9945b`)
**Repo:** https://github.com/shazifadam/medlog

## Docs

| Doc | Contents |
|---|---|
| [docs/product-spec.md](docs/product-spec.md) | Product & functional spec v1.0 — modules, behaviors, acceptance criteria, milestones M1–M5 |
| [docs/design-system.md](docs/design-system.md) | Design tokens (Part A), screen specs B1–B8 (Part B), Flutter notes (Part C) |
| [design/tokens.json](design/tokens.json) | Token source of truth — the Dart tokens file is generated from this; no raw hex/pt values in widgets |

## Design rules (non-negotiable)

- Coral `#FF5A4E` is the identity accent. SOS elements always use the hotter systemRed `#D70015` — the two never blend.
- All spacing on a 4pt grid; tap targets ≥ 44pt; Dynamic Type supported everywhere.
- Glass surfaces only on chrome (nav/tab bars, SOS strip, next-up card, sheets) — never on long list cells.
- Offline-first, encrypted at rest, no third-party analytics on health content.

## Structure

```
lib/
  main.dart
  theme/        # generated tokens + GlassSurface
  features/     # home schedule, records, logger, vitals, settings
docs/           # specs (synced from Obsidian vault)
design/         # tokens.json (source of truth)
```

## Milestones

M1 medication CRUD + schedule + notifications → M2 SOS meds + safety rules → M3 record logger → M4 vitals + charts + export → M5 polish (app lock, a11y, onboarding).
