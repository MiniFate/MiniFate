# AGENTS.md

`CLAUDE.md` and `GEMINI.md` are symlinks to this file.

## Project Overview

Minifate — a Jekyll site for a minimal Fate RPG ruleset. Chapters live in
`_chapters/`, and `_code/` holds the helper scripts that generate play aids.

## Operations

```bash
make serve          # local dev server with live reload
make build          # production build
make check          # build + internal link, image, and alt-text checks
make check-browser  # build + Chromium layout, accessibility, and print checks
make lint-scripts   # ruff check + ruff format --check over _code/
make format-scripts # ruff format + ruff check --fix over _code/
```

Docker mechanics (image build, user-ID forwarding, dependency locking)
follow the house Makefile conventions; see the Docker Makefile Patterns
knowledge-base article.

## Python

`_code/make_dice_macros.py` generates dice roll macros. Ruff config is in
`ruff.toml` at the repo root, pinned via the `RUFF` variable in the Makefile
for consistent local runs.

Markdown is excluded from ruff: 0.16 formats Python code fences inside
`.md`, and the chapters are prose.

Browser regression tests live in `_scripts/tests/`. Their dependencies are
locked in `_scripts/uv.lock`; run them with `make check-browser`. They cover
responsive layout, heading permalinks, list markers, theme colors, and print
output. Run `make check` as well to match CI's site checks. See `README.md`
for host prerequisites.

The dice macro generator has no dedicated test suite, type checking, or
coverage gate.
