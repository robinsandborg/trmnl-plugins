# Agenda Calendar

A dense, agenda-first TRMNL widget that shows a Google Calendar at a glance. Designed for e-ink devices where a traditional week grid wastes space on empty hours.

Pairs well with, or replaces, the sibling `google-calendar-week` widget when you want to prioritise reading upcoming appointments over seeing time-of-day structure.

## What It Shows

- Month name
- A two-week mini calendar (current week and next week), Monday-first
  - Today has a filled circle behind the date
  - Past days in the current week are de-emphasised
  - Each day has small dots under the number — one dot per event, capped at three
- A three-column agenda below the mini calendar
  - Only days that actually have events appear
  - Several days may stack inside one column if they fit
  - Today stays visible all day: past events are struck through and greyed; upcoming events are bold
  - All-day events are tagged "HELE DAGEN"
  - If a single day has too many events to fit, the tail is replaced with "+ flere"
- Norwegian labels (`Mandag`, `Tirsdag`, …, `April`, …) and 24-hour time

The agenda window defaults to 14 days ahead, matching the mini calendar.

## Setup

### 1. Get the Google Calendar secret iCal URL

Same as `google-calendar-week`:

1. Open Google Calendar on desktop.
2. Hover the calendar you want under `My calendars`.
3. Open `Settings and sharing`.
4. Scroll to `Integrate calendar`.
5. Copy the `Secret address in iCal format`.

Treat the URL like a password.

### 2. Import into LaraPaper

```bash
cd agenda-calendar
./build.sh
```

Then import `agenda-calendar.zip` as a recipe/plugin in LaraPaper and fill in:

- `Google Calendar iCal URL` (required)
- `Agenda window (days)` (default `14`; controls how far ahead the agenda looks)

## Local Preview

Preview runs in Docker so the host stays Ruby-free. From the repo root:

```bash
bin/preview agenda-calendar
```

The container builds on first run (~1 minute), then serves the dev UI at http://localhost:4567.

The local `.trmnlp.yml` (gitignored) supplies mock iCal data and a fixed timestamp so the preview is deterministic — by default it renders as if it were Tuesday 7 April 2026 at 12:00 Europe/Oslo. Edit that file to exercise different dates or event mixes.

Device-specific screen sizes are selectable in the preview picker:

- `TRMNL OG` → the canonical 800×480 layout
- `Amazon Kindle PW Signature 11th Gen` → small e-ink, 800×480 as well but rendered to a 6.8" 300-DPI screen
- `Amazon Kindle Scribe` → 992×744, close to the reMarkable screen footprint

The layout is height-aware: when more vertical room is available, the three columns balance so none of them sits empty.

## Files

```text
agenda-calendar/
├── .trmnlp.yml          # Local preview config (gitignored)
├── build.sh             # Packages src/ into agenda-calendar.zip
├── README.md
└── src/
    ├── full.liquid
    └── settings.yml
```

## Notes

- Full-screen only; no half or quadrant layouts.
- Read-only, single Google Calendar, secret iCal URL only.
- Norwegian labels and `Europe/Oslo` time zone are baked in — edit `src/full.liquid` if you need a different locale.
