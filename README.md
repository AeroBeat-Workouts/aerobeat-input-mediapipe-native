# AeroBeat Input Driver - Native MediaPipe

This is the official input driver repo for AeroBeat's native MediaPipe support.

Unlike the simpler input-driver repos in Batch 1, this package carries MediaPipe-specific runtime baggage: the Godot addon in `src/` is only one side of the integration, and any real camera / native / Python runtime setup has to be treated as an environment concern instead of pretending the hidden testbed alone proves end-to-end MediaPipe capture.

## 📋 Repository Details

*   **Type:** Input Driver
*   **License:** **Mozilla Public License 2.0 (MPL 2.0)**
*   **Dependencies:**
    *   `aerobeat-core` (Required for the Godot addon/testbed contract)
    *   `aerobeat-vendor-*` (Allowed)
    *   Native / Python runtime dependencies for real MediaPipe execution (repo currently ships only an empty placeholder `requirements.txt`, so the Godot-side migration does not claim a fully pinned Python runtime yet)

## GodotEnv development flow

This repo now uses the AeroBeat GodotEnv package convention for the Godot-side addon/workbench.

- Canonical dev/test manifest: `.testbed/addons.jsonc`
- Installed dev/test addons: `.testbed/addons/`
- GodotEnv cache: `.testbed/.addons/`
- Hidden workbench project: `.testbed/project.godot`
- Repo-local unit tests: `.testbed/tests/`
- Source bridge: committed `.testbed/src -> ../src` for this repo's `src/`-rooted addon layout

The repo root remains the package/published boundary for downstream consumers. Day-to-day Godot addon development, debugging, and validation happen from the hidden `.testbed/` workbench using the pinned OpenClaw toolchain: Godot `4.6.2 stable standard`.

## Restore dev/test dependencies

From the repo root:

```bash
cd .testbed
godotenv addons install
```

That restores the pinned Godot-side dev/test dependencies (`aerobeat-core` and GUT) into `.testbed/addons/`.

## Open the workbench

From the repo root:

```bash
godot --editor --path .testbed
```

Use this `.testbed/` project as the canonical direct-development and bugfinding surface for the Godot addon layer.

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

## Native / Python runtime note

This migration intentionally only replaces the repo's legacy bootstrap flow for the Godot-side testbed/workbench contract.

It does **not** claim that this repo now contains a complete repo-local MediaPipe runtime installation story:

- `requirements.txt` currently exists but is empty.
- The current local validation path proves the hidden Godot workbench can restore/import/test correctly.
- Real MediaPipe execution still depends on future concrete native/Python runtime packaging and environment validation, which should be handled explicitly when that implementation exists rather than implied by this migration.

## Validation notes

- `.testbed/addons.jsonc` is the committed dev/test dependency contract.
- The manifest pins `aerobeat-core` to `v0.1.0` and GUT to `main`.
- Repo-local unit tests live under `.testbed/tests/`; the hidden workbench uses the committed `.testbed/src -> ../src` bridge for this repo's `src/`-rooted package layout.
- The current package shape is consumed from the repo root (`subfolder: "/"`) for downstream installs.
- CI follows the same GodotEnv restore/import/GUT path as local workbench validation; it does not attempt to install or exercise a real MediaPipe-native runtime because the repo does not yet ship a concrete pinned Python/native environment definition.

## 📂 Structure

*   `src/` - The Godot addon layer for the native MediaPipe input driver.
*   `.testbed/tests/` - Repo-local unit tests run by the hidden testbed.
*   `.testbed/` - The hidden Godot workbench used to restore, run, and debug the addon.
*   `requirements.txt` - Placeholder for future repo-local Python dependency pinning; currently empty.
