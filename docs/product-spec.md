# Health Tracker App — Product & Functional Specification

**Version:** 1.0 (Draft)
**Date:** July 2026
**Status:** For review
**Related:** [[Health Tracker — Design System & Screen Specs]] · [[Personal Med Log — Index]]

---

## 1. Overview

### 1.1 Purpose
A personal health management app that helps users stay on top of their medications, keep all medical records in one organized place, and log medications taken and vital signs over time.

### 1.2 Core Modules
1. **Home Screen (Medication Schedule)** — an upcoming-medication timeline presented like a to-do list, with SOS/emergency medications always pinned and visually distinct.
2. **Health Record Logger** — capture and organize photos of prescriptions, scans, and blood work, tagged with date, doctor, and speciality.
3. **Medication & Vital Logger** — record medications taken and track vital signs (BP, glucose, weight, heart rate, etc.).

### 1.3 Target Users
- Individuals managing chronic conditions with recurring medication schedules.
- Caregivers managing a family member's health (future: multi-profile support).
- Anyone who wants a single organized archive of their medical documents.

### 1.4 Guiding Principles
- **Glanceable:** the user should know "what do I take next?" within one second of opening the app.
- **Low friction logging:** marking a dose as taken or snapping a record photo should take ≤ 2 taps.
- **Offline-first:** all core features work without a network connection; sync (if any) happens in the background.
- **Private by default:** health data is sensitive — encrypted at rest, no third-party analytics on health content.

---

## 2. Module 1 — Home Screen (Medication Schedule)

### 2.1 Description
The home screen is the app's landing page. It shows today's medication doses as a chronological checklist, plus a persistent SOS section for emergency/as-needed medications.

### 2.2 Layout (top to bottom)
1. **Header** — current date, greeting, profile avatar.
2. **SOS strip (always visible / pinned)** — horizontally scrollable cards for SOS medications, rendered in a distinct alert color (e.g., red/amber accent with an SOS badge). This strip never scrolls out of view; it is anchored below the header (or as a sticky footer — decide in design review).
3. **Upcoming doses list (to-do style)** — today's doses grouped by time slot:
   - Overdue (missed, still actionable) — highlighted
   - Next up — emphasized card with countdown ("in 45 min")
   - Later today — standard cards
   - Completed — collapsed section, greyed out with checkmarks
4. **Quick actions bar / FAB** — shortcuts to "Log vital", "Add record", "Add medication".

### 2.3 Dose Card Contents
- Medication name + strength (e.g., Metformin 500 mg)
- Dose instruction (1 tablet, after food)
- Scheduled time
- Status: Upcoming / Due / Overdue / Taken / Skipped
- Actions: **Take** (primary), **Skip** (with optional reason), **Snooze** (10/30/60 min)

### 2.4 SOS Medications
- SOS meds are "as needed" (PRN) medications for emergencies — e.g., nitroglycerin, rescue inhaler, anti-allergy injection.
- Marked as SOS when the medication is created (toggle: "This is an SOS / emergency medication").
- Rendered in an **indicated alert color** (design token: `color.sos`, e.g., red `#D93025` background tint or border) with an SOS badge so they are unmistakable.
- Tapping an SOS card shows: dosage instructions, max doses per day, minimum gap between doses, and a one-tap **"Taken now"** button that logs the time.
- Safety rule: if the max daily count or minimum gap would be violated, show a prominent warning before logging (do not silently block — this is an emergency context).

### 2.5 Behaviors & Rules
- Doses generate automatically from each medication's schedule (see §4.2).
- A dose becomes **Due** at its scheduled time and **Overdue** after a configurable grace window (default 60 min).
- Marking **Taken** writes an entry to the Medication Log (§4) with the actual timestamp.
- Local push notifications fire at each dose time; notification actions: Take / Snooze / Skip.
- Midnight rollover: unactioned overdue doses are auto-marked **Missed** and appear in adherence history.
- Empty state: if no medications exist, show onboarding prompt to add the first one.

### 2.6 Acceptance Criteria (samples)
- Given 3 scheduled doses today, when the user opens the app, then all 3 appear in chronological order with correct statuses.
- Given an SOS medication exists, the SOS strip is visible without scrolling on a standard phone viewport.
- When the user taps **Take**, the dose moves to Completed and a log entry with the current timestamp is created within 1 second.

---

## 3. Module 2 — Health Record Logger

### 3.1 Description
A digital filing cabinet for medical documents. Users photograph or import prescriptions, scan reports (X-ray, MRI, ultrasound), and blood work / lab reports, and tag them with metadata so they can be found later.

### 3.2 Record Types
| Type | Examples | Extra fields |
|---|---|---|
| Prescription | Doctor's Rx sheet | Doctor name, speciality |
| Scan / Imaging | X-ray, MRI, CT, ultrasound report | Body part / study type (optional) |
| Blood work / Lab | CBC, lipid panel, HbA1c | Lab name (optional) |
| Other | Discharge summary, vaccination card | Free-text label |

### 3.3 Add-Record Flow
1. Tap **Add record** (from home quick actions or Records tab).
2. Choose source: **Camera** (with multi-page capture) or **Gallery / file import** (JPG, PNG, PDF).
3. Enter metadata:
   - **Date of record** (defaults to today; user-editable — supports backdating old documents)
   - **Record type** (Prescription / Scan / Blood work / Other)
   - **Doctor** — pick from previously used doctors or add new (name + speciality)
   - **Speciality** — auto-filled from the selected doctor; shown prominently when the type is Prescription (per requirement), editable
   - Optional: title, notes, tags
4. Save. Images are stored encrypted; a thumbnail is generated for list views.

### 3.4 Doctor Directory (supporting entity)
- Doctors are reusable entities: name, speciality, optional clinic/hospital, phone.
- Speciality picker: searchable list (Cardiology, Endocrinology, Orthopedics, General Physician, etc.) + free-text entry.
- Selecting a doctor on a new record auto-fills speciality.

### 3.5 Browse & Search
- Records tab: reverse-chronological grid/list with thumbnails.
- Filters: record type, doctor, speciality, date range.
- Search: title, doctor name, notes, tags.
- Record detail view: full-screen zoomable image(s)/PDF, metadata panel, actions (edit metadata, share/export, delete with confirmation).

### 3.6 Acceptance Criteria (samples)
- User can attach multiple photos to one record (e.g., 3-page lab report).
- Filtering by "Cardiology" returns all records linked to any cardiologist.
- Editing the date of a record re-sorts it correctly in the timeline.

---

## 4. Module 3 — Medication & Vital Logger

### 4.1 Description
Two related logs: (a) the medication log — a history of every dose taken/skipped/missed, and (b) the vitals log — time-stamped measurements of health metrics.

### 4.2 Medication Management
**Medication entity fields:**
- Name, strength, form (tablet/capsule/syrup/injection/inhaler/drops)
- Schedule: times per day with specific clock times, or interval-based (every N hours), or specific weekdays
- Instructions (before/after food, with water, etc.)
- Duration: ongoing or end date / number of days
- SOS flag (see §2.4) — SOS meds have no schedule; instead they have max/day and min-gap fields
- Optional: linked prescription record (from Module 2), stock count with low-stock reminder, prescribing doctor

**Medication log entry:** medication, scheduled time, actual time, status (taken/skipped/missed/SOS-taken), optional note.

### 4.3 Vitals Logging
**Supported vitals (v1):**
- Blood pressure (systolic/diastolic, mmHg) + pulse
- Blood glucose (mg/dL or mmol/L; context: fasting / post-meal / random)
- Heart rate (bpm)
- Body weight (kg/lb)
- Body temperature (°C/°F)
- SpO₂ (%)
- Custom metric (name + unit) — extensibility hook

**Logging flow:** pick vital → enter value(s) → timestamp defaults to now (editable) → optional note → save. Target: ≤ 10 seconds end to end.

### 4.4 History & Trends
- Per-vital history list and line chart (7 / 30 / 90 days, custom range).
- Simple reference bands on charts (e.g., BP normal range) for context — clearly labeled as general reference, not medical advice.
- Medication adherence view: % doses taken per week/month, calendar heat map.
- Export: CSV/PDF summary of vitals and medication history for sharing with a doctor.

### 4.5 Acceptance Criteria (samples)
- Logging a BP reading creates one entry containing systolic, diastolic, and pulse together.
- The glucose chart distinguishes fasting vs post-meal readings.
- Deleting a medication does not delete its historical log entries (they remain, marked as archived medication).

---

## 5. Cross-Cutting Requirements

### 5.1 Data Model (high level)
```
User ─┬─ Medication ─┬─ DoseSchedule ── DoseInstance (generated)
      │              └─ MedicationLogEntry
      ├─ Doctor (name, speciality, clinic)
      ├─ HealthRecord (type, date, doctorId, files[], tags[])
      └─ VitalEntry (type, values{}, timestamp, note)
```

### 5.2 Notifications
- Local notifications for dose times (works offline).
- Actionable buttons on the notification: Take / Snooze / Skip.
- Low-stock and refill reminders (optional, v1.1).

### 5.3 Security & Privacy
- All data encrypted at rest (database + image files).
- Optional app lock: biometric / PIN.
- No health data leaves the device without explicit user action (export/share). If cloud backup is added later, it must be end-to-end encrypted and opt-in.
- Compliance posture: design with HIPAA/GDPR sensitivity in mind even if not formally covered (personal-use app).

### 5.4 Accessibility & UX
- Large tap targets for Take/Skip (older users are a core audience).
- SOS color must also carry a non-color indicator (badge/icon) for color-blind users.
- Dynamic type support; screen-reader labels on all dose actions.

### 5.5 Non-Goals (v1)
- No diagnosis, dosage recommendations, or drug-interaction checking.
- No doctor-facing portal or telemedicine.
- No wearable/device integrations (candidate for v2 via Apple Health / Google Health Connect).

---

## 6. Suggested Tech Notes (non-binding)
- **Platform:** cross-platform mobile (Flutter or React Native) or native; offline-first local DB (SQLite/Realm/Drift).
- **Images:** store compressed originals + thumbnails in app-private encrypted storage.
- **Dose generation:** materialize dose instances 7 days ahead via a daily background job; regenerate on schedule edits.
- **State:** single source of truth in local DB; UI observes reactively.

---

## 7. Open Questions
1. Single user only, or multiple profiles (e.g., caregiver managing a parent)?
2. Cloud backup/sync in v1, or local-only with manual export?
3. Should SOS strip sit at the top of the home screen or as a sticky bottom bar?
4. Units/locale defaults (mg/dL vs mmol/L, kg vs lb) — auto by region or onboarding choice?
5. Reminder escalation: re-notify if a dose stays overdue (e.g., after 15 min)?

---

## 8. Milestone Plan (suggested)
| Milestone | Scope |
|---|---|
| M1 | Medication CRUD + home screen schedule + Take/Skip + notifications |
| M2 | SOS medications + safety rules + adherence history |
| M3 | Health record logger (capture, metadata, doctor directory, search) |
| M4 | Vitals logging + charts + export |
| M5 | Polish: app lock, accessibility pass, empty states, onboarding |
