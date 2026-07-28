# AGENTS.md

`CLAUDE.md` and `GEMINI.md` are symlinks to this file.

## Project Overview

Minifate — a Jekyll site for a minimal Fate RPG ruleset. Chapters live in
`_chapters/`, and `_code/` holds the helper scripts that generate play aids.

## Operations

```bash
make serve          # local dev server with live reload
make build          # production build
make lint-scripts   # ruff check + ruff format --check over _code/
make format-scripts # ruff format + ruff check --fix over _code/
```

Docker mechanics (image build, user-ID forwarding, dependency locking)
follow the house Makefile conventions; see the Docker Makefile Patterns
knowledge-base article.

## Python

`_code/make_dice_macros.py` generates dice roll macros. Ruff config is in
`ruff.toml` at the repo root, pinned via the `RUFF` variable in the Makefile
so local runs and CI agree.

Markdown is excluded from ruff: 0.16 formats Python code fences inside
`.md`, and the chapters are prose.

This is a single-script repo, so there is deliberately no test suite, type
checking, or coverage gate. The project-standards audit's warnings about
those reflect the shape rather than neglect.
