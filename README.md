# trmnl-plugins

Personal TRMNL widget source for a self-hosted, DIY e-ink setup.

This repository is where I keep the widgets I build for my own TRMNL-compatible displays. It currently contains a single plugin, but the intent is for this to grow into a small personal library of widgets over time.

I am not using TRMNL's hosted service or official hardware for this setup. Instead, I run a self-hosted [LaraPaper](https://github.com/usetrmnl/larapaper) instance from a local checkout at `../larapaper` and render these widgets on repurposed e-ink devices as a way to reduce e-waste rather than buying new dedicated hardware.

## Philosophy

- Self-hosted over SaaS
- Repurposed hardware over buying new devices
- Small, readable widget folders over a monolithic app
- TRMNL-compatible output without depending on the official cloud

## Repository Layout

Each widget lives in its own directory and is intended to be self-contained.

```text
.
├── posthog-analytics/
│   ├── src/                 # TRMNL plugin source files
│   ├── .trmnlp.yml          # Local preview config and sample custom fields
│   ├── build.sh             # Builds the distributable zip
│   └── README.md            # Widget-specific setup and usage
├── AGENTS.md                # Instructions for coding agents
└── README.md
```

## Widgets

| Widget | Status | Notes |
|---|---|---|
| [`agenda-calendar`](./agenda-calendar) | active | Dense agenda view of a Google Calendar with a two-week mini header |
| [`google-calendar-week`](./google-calendar-week) | active | Weekly Google Calendar view for LaraPaper using a private iCal feed |
| [`posthog-analytics`](./posthog-analytics) | active | PostHog analytics dashboards for e-ink displays |
| [`yr-weather`](./yr-weather) | active | Norwegian weather forecast from MET.no with hourly chart |

## How This Repo Fits Together

This repo is the source of truth for widget code and templates.

`../larapaper` is the app that hosts the widgets, serves the TRMNL-compatible backend, and manages devices and scheduling.

The typical workflow is:

1. Build or edit a widget in this repo.
2. Preview it locally with `trmnl_preview` when useful.
3. Import or copy the widget's `src/` assets into LaraPaper.
4. Use LaraPaper as the backend for connected clients and DIY displays.

There is no hosted TRMNL dependency in the intended day-to-day workflow for this repo.

## Local Development

### Preview a widget

Widgets preview via [`trmnl_preview`](https://github.com/usetrmnl/trmnlp). The preferred path is the Docker wrapper in `bin/preview`, which keeps Ruby off the host:

```bash
bin/preview agenda-calendar
# → http://localhost:4567
```

The image is built from the root `Dockerfile` on first run (~1 min). The script mounts the chosen widget directory into the container, so local edits hot-reload.

If you already have Ruby and the gem installed locally, the direct form still works:

```bash
cd agenda-calendar
trmnlp serve
```

### Build a widget package

If a widget includes a `build.sh`, use it from that widget directory:

```bash
cd posthog-analytics
./build.sh
```

That script currently packages `src/` into a zip that can be imported into a TRMNL-compatible host workflow.

## Adding a New Widget

Create a new top-level directory for the widget and keep it self-contained.

Recommended structure:

```text
your-widget/
├── src/
├── .trmnlp.yml
├── build.sh
└── README.md
```

Guidelines:

- Keep widget-specific setup in that widget's own `README.md`
- Include a local preview config when possible
- Add a simple packaging script if the widget needs to be imported elsewhere
- Update the root widget list in this `README.md`
- Do not commit real secrets in preview configs or examples

## Notes

- This repo is primarily about widget source, not about operating LaraPaper itself
- LaraPaper setup and server concerns live in the local `../larapaper` checkout
- Widget code here should stay compatible with the self-hosted deployment model
