# AGENTS.md

Instructions for AI coding agents working in this repository.

## Context

- This repo contains source for personal TRMNL-compatible widgets
- It is not the backend app
- The backend and hosting layer live in `../larapaper`
- The intended deployment target is self-hosted LaraPaper plus repurposed e-ink hardware
- Do not assume TRMNL cloud services or official TRMNL hardware are part of the default workflow

## Repository Shape

- Each widget should live in its own top-level directory
- Widget folders should be self-contained and usually include `src/`, `.trmnlp.yml`, `build.sh`, and a widget-specific `README.md`
- The root `README.md` is the catalog and project overview

## Working Rules

- Preserve the self-hosted, DIY positioning in documentation and implementation choices
- Prefer changes that keep widgets portable and easy to import into LaraPaper
- Keep per-widget setup documented inside the widget directory, not only at the repo root
- Update the root `README.md` when adding, renaming, or removing widgets
- Avoid introducing repo-wide tooling unless there is a clear need across multiple widgets

## LaraPaper Boundary

- Read `../larapaper` when you need integration context
- Do not edit `../larapaper` unless the user explicitly asks for cross-repo changes
- If a widget change depends on LaraPaper behavior, document the assumption clearly

## Secrets And Sample Data

- Never commit real API keys, tokens, or private endpoints
- Treat `.trmnlp.yml` and docs as example or local preview material, not a place for live credentials
- If you find committed secrets, stop and flag them to the user instead of silently rotating or rewriting history

## Widget Conventions

- Keep Liquid templates and settings in `src/`
- Keep packaging scripts minimal and local to the widget
- Prefer simple shell scripts over heavy build systems for packaging
- Preserve compatibility with local preview workflows when editing widget files
- Document any required external services, custom fields, or saved queries in the widget's `README.md`

## Documentation Expectations

- Root `README.md`: explain repo purpose, workflow, and current widget list
- Widget `README.md`: explain what the widget does, required inputs, setup, preview, and packaging
- Keep docs concrete and operational; avoid generic TRMNL marketing language

## Validation

- For documentation-only changes, a careful read-through is usually sufficient
- For widget changes, run the smallest relevant local validation available, such as the widget build script or preview command, if dependencies are present
- If you could not validate something, state that explicitly in the final response
