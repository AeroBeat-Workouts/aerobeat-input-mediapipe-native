# AeroBeat Input Driver - Native MediaPipe

This repo preserves AeroBeat's **future native MediaPipe camera path**.

It is **not** the current official v1 gameplay-input repo. The locked AeroBeat v1 gameplay path is **PC camera gameplay first**, with official gameplay support centered on **camera input for Boxing and Flow**. This repo exists to keep the follow-on **mobile / on-device camera** direction documented and versioned without pretending that path is the current shipping target.

## Current repo stance

- **Official v1 gameplay path today:** PC camera + active gameplay focus on Boxing and Flow
- **This repo's role:** future-facing native / mobile camera integration work
- **Current implementation reality:** repo scaffolding, manifest wiring, and placeholder runtime surfaces only
- **Not claimed here:** a complete, validated on-device MediaPipe runtime or production mobile packaging story

## 📋 Repository Details

- **Type:** Input Driver
- **License:** **Mozilla Public License 2.0 (MPL 2.0)**
- **Dependencies:**
  - `aerobeat-input-core` (canonical shared input contract)
  - `aerobeat-vendor-*` (allowed)
  - future platform/runtime dependencies for native MediaPipe execution when this path is actively implemented

## Why this repo still exists

AeroBeat's docs still keep mobile camera support as a meaningful follow-on path after the PC-first community release. Preserving this repo helps by:

- reserving the package/repo boundary for native MediaPipe work
- keeping the Godot-side testbed/package contract aligned with the current lane architecture
- avoiding future confusion between "documented future path" and "official v1 gameplay path"

## GodotEnv development flow

This repo uses the AeroBeat GodotEnv package convention for the Godot-side addon/workbench.

- Canonical dev/test manifest: `.testbed/addons.jsonc`
- Installed dev/test addons: `.testbed/addons/`
- GodotEnv cache: `.testbed/.addons/`
- Hidden workbench project: `.testbed/project.godot`
- Repo-local unit tests: `.testbed/tests/`
- Source bridge: committed `.testbed/src -> ../src` for this repo's `src/`-rooted addon layout

The repo root remains the package/published boundary for downstream consumers. Day-to-day Godot addon validation happens from the hidden `.testbed/` workbench using the pinned OpenClaw toolchain: Godot `4.6.2 stable standard`.

## Restore dev/test dependencies

From the repo root:

```bash
cd .testbed
godotenv addons install
```

This restores the current repo-local dev/test dependency contract into `.testbed/addons/`.

## Open the workbench

From the repo root:

```bash
godot --editor --path .testbed
```

Use this `.testbed/` project as the canonical direct-development and bugfinding surface for the Godot-side package layer.

## Import smoke check

From the repo root:

```bash
godot --headless --path .testbed --import
```

## Run unit tests

From the repo root:

```bash
godot --headless --path .testbed --script addons/gut/gut_cmdln.gd \
  -gdir=res://tests \
  -ginclude_subdirs \
  -gexit
```

## Runtime status note

This repo does **not** currently claim a full native MediaPipe runtime stack.

Today it ships:

- repo/package metadata
- a hidden Godot workbench for restore/import/test validation
- placeholder `src/` runtime surfaces that explicitly mark the repo as future-facing
- a placeholder `requirements.txt` so future runtime dependency pinning has an obvious home

That means local validation here proves the package/testbed contract is healthy, **not** that a production-ready native/mobile camera stack is already implemented.

## Validation notes

- `.testbed/addons.jsonc` is the committed dev/test dependency contract.
- The manifest now points directly at `aerobeat-input-core`, matching the current lane-based dependency model.
- Repo-local unit tests live under `.testbed/tests/`; the hidden workbench uses the committed `.testbed/src -> ../src` bridge for this repo's `src/`-rooted package layout.
- The current package shape is consumed from the repo root (`subfolder: "/"`) for downstream installs.
- CI follows the same GodotEnv restore/import/GUT path as local workbench validation; it does not attempt to exercise a real native/mobile MediaPipe runtime because that runtime is not implemented here yet.

## 📂 Structure

- `src/` - Future-facing Godot-side runtime surfaces for native/mobile MediaPipe integration
- `.testbed/tests/` - Repo-local unit tests run by the hidden testbed
- `.testbed/` - Hidden Godot workbench used to restore, run, and debug the package
- `requirements.txt` - Placeholder for future repo-local runtime dependency pinning; intentionally not populated yet
