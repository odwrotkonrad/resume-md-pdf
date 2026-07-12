# AGENTS Guide

## Project Scope

This repository generates a single-page PDF resume from Markdown. Tracked resume content is fictional sample data, keep it that way: never commit real personal data. Real resumes live only under `.user/input/` (gitignored), built with the same scripts or `make generate-user-pdfs`.

Two tracked source resumes:

- `example/resume.md`
- `example/styled_resume.md`

Generated PDFs are created next to their source Markdown files and stay untracked:

- `example/resume.pdf`
- `example/styled_resume.pdf`

## Markdown to PDF

Preferred direct command for Markdown to PDF:

`npx --yes md-to-pdf <file>.md`

Preferred scripted command:

- `./scripts/build-pdf.sh example/resume.md`
- `./scripts/build-pdf.sh example/styled_resume.md`

## Continuous PDF Regeneration (Watcher)

Use the watcher to rebuild PDFs automatically on file changes:

`./scripts/watch-pdfs.sh`

Behavior:

- Runs an initial build for both resume files.
- Watches `example/resume.md` and `example/styled_resume.md`.
- Rebuilds only the changed file.
- Prints timestamped logs to stdout.
- Prints failures to stderr.

## Make Targets

Use `make` targets from the repository root:

- `make compare-contents`
  - Runs `validation/test_content_match.py`.
  - Strips styles/HTML from `example/styled_resume.md`.
  - Compares against `example/resume.md` with whitespace-insensitive comparison.
  - Generates:
    - `validation/artifacts/styled_resume_stripped.md`
    - `validation/artifacts/diff.txt`
  - Informational only: warns on content differences, does not fail on mismatch.
- `make generate-pdfs`
- `make watch-pdfs`
