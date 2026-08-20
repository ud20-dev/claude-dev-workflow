# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Bunch of skills to improve dev workflow and code quality, including:
    - `unslop`: Removes AI patterns from writing and adds human voice.
    - `bum-dev`: Encourages minimalistic coding practices to avoid over-engineering.
    - `minmax`: Promotes removing complexity before adding new features.
- `SessionStart` hook (`.claude/hooks/session-start.sh`) that loads `docs/CLAUDE.md` and the latest sessions of `docs/PROGRESS.md` automatically, and checks the template version in silence.
- `.claude/scripts/changelog.sh`: prints what changed upstream and, for a known major version jump, the migration steps to follow.
- One-liner remote install: `curl -fsSL .../install.sh | bash` from a project's root now scaffolds `docs/` and `.claude/` directly, no manual clone needed.

### Changed

- `PROGRESS.md`, `DECISIONS.md`, `ERRORS.md`, `FEEDBACK.md`, and `CHANGELOG.md` now use newest-first ordering with a `<!-- SENTINEL -->` marker at the insertion point, so new entries always go on top and the latest one is immediately visible.
- Template version check no longer runs as a manual step Claude performs each session — it's handled by the `SessionStart` hook instead.
- `install.sh` no longer requires cloning the whole repo as a subfolder of the target project; it fetches only what it needs and is purely additive (refuses instead of overwriting).


## [1.1.0] - 2026-08-16

### Added

- Improved documentation structure for working with Claude on web projects.
- Installation scripts for setting up the project environment.

## [1.0.0] - 2026-XX-XX (Please replace with actual release date)

- Initial release of the project with basic features and documentation.