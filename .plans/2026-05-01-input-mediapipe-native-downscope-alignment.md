# aerobeat-input-mediapipe-native

**Date:** 2026-05-01  
**Status:** In Progress  
**Agent:** Chip 🐱‍💻

---

## Goal

Align `aerobeat-input-mediapipe-native` with the locked AeroBeat v1 downscope. Future/deprioritized mobile-follow-on camera path; deeper cleanup needed.

---

## Overview

This repo is part of the AeroBeat input/platform downscope wave following the completed shell pass. The work stays narrow and truthful: inspect README/plugin/testbed/manifest/dependency surfaces, remove stale parity claims, and ensure this repo's current role matches the downscoped docs truth.

This repo needed a deeper cleanup than the lighter platform-pass repos because it still implied a present-tense "official" native MediaPipe driver story while also carrying transition-era dependency naming and nearly empty runtime surfaces. The cleanup below keeps the repo honest as a preserved future/mobile camera path instead of a current v1 gameplay-input claim.

---

## REFERENCES

| ID | Description | Path |
| --- | --- | --- |
| `REF-01` | Parent input/platform coordination plan | `/home/derrick/.openclaw/workspace/projects/openclaw-chip/.plans/2026-05-01-aerobeat-input-platform-downscope-pass.md` |
| `REF-02` | Downscoped docs source of truth | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-docs` |
| `REF-03` | Owning repo | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-input-mediapipe-native` |

---

## Tasks

### Task 1: Audit and align repo truth

**Bead ID:** `oc-3bs`  
**SubAgent:** `primary`  
**Role:** `coder`  
**References:** `REF-01`, `REF-02`, `REF-03`  
**Prompt:** Claim the assigned bead, audit the repo against the downscoped AeroBeat docs truth, implement the required alignment changes, run relevant validation, commit/push to `main`, and leave concise QA handoff notes.

**Folders Created/Deleted/Modified:**
- `.plans/`
- `.testbed/tests/`
- `src/`
- `src/strategies/`

**Files Created/Deleted/Modified:**
- `README.md`
- `plugin.cfg`
- `.testbed/addons.jsonc`
- `requirements.txt`
- `src/input_manager.gd`
- `src/strategies/strategy_mediapipe.gd`
- `.testbed/tests/test_example.gd`
- `.plans/2026-05-01-input-mediapipe-native-downscope-alignment.md`

**Status:** ✅ Complete

**Results:**
- Reframed the repo as a **future native/mobile MediaPipe camera path**, not the current official v1 gameplay-input repo, matching the locked docs truth in `REF-02`.
- Removed stale transition-era manifest language by switching `.testbed/addons.jsonc` from `aerobeat-core` to `aerobeat-input-core` and pinning `git@github.com:AeroBeat-Workouts/aerobeat-input-core.git` at `v0.1.2`.
- Updated `plugin.cfg` wording so the plugin manifest no longer reads like an active shipping hardware/input path.
- Converted the empty runtime files in `src/` into truthful placeholders that explicitly report future/mobile-follow-on status instead of silently implying missing implementation.
- Added test coverage that verifies the runtime placeholders load and explicitly deny official-v1/completed-runtime claims.
- Clarified `requirements.txt` as an intentionally unpinned placeholder rather than an accidental omission.
- Validation passed via the repo's documented GodotEnv + Godot import + GUT path.
- Implementation commit hash: `0f7fd88a759e062a464fc78d903cb33635ffd319`; plan handoff commit: `e9db80bccf898fab6273f4760af77c6acd81433c`

---

## Final Results

**Status:** ✅ Coder Complete / Awaiting QA + Audit

**What We Built:**
A deeper truth-alignment cleanup for `aerobeat-input-mediapipe-native` that keeps the repo preserved as a future/mobile camera lane while removing stale messaging and dependency naming that made it look like a current official v1 input path.

**Reference Check:**
- `REF-01`: matched the parent downscope intent for this deeper-cleanup repo.
- `REF-02`: aligned repo wording with the locked docs truth that official v1 gameplay input is camera-first on PC, while mobile/native camera remains future follow-on work.
- `REF-03`: updated the owning repo's README/plugin/manifest/runtime/test surfaces directly.

**Validation:**
- `cd .testbed && godotenv addons install`
- `godot --headless --path .testbed --import`
- `godot --headless --path .testbed --script addons/gut/gut_cmdln.gd -gdir=res://tests -ginclude_subdirs -gexit`
- Result: `3/3 passed`

**Commits:**
- `0f7fd88a759e062a464fc78d903cb33635ffd319` - Align native MediaPipe repo with downscoped v1 truth
- `e9db80bccf898fab6273f4760af77c6acd81433c` - Record native MediaPipe coder handoff details

**QA Handoff Notes:**
- Verify README/plugin wording stays future-facing and never calls this the current official v1 gameplay-input repo.
- Sanity-check `.testbed/addons.jsonc` restored `aerobeat-input-core@v0.1.2` cleanly in a fresh workbench.
- Confirm the placeholder runtime surfaces are acceptable for a preserved repo and do not create false expectations about implemented native/mobile capture.

**Lessons Learned:**
This repo was more misleading by omission than by explicit bad claims: empty runtime files plus old manifest naming quietly suggested unfinished "current" work. Turning those surfaces into explicit future-facing placeholders made the package truth much clearer.

---

*Completed on 2026-05-01 (coder handoff; bead remains open for QA/audit)*
