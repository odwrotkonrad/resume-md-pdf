# AGENTS Guide

## Project Scope

This repository generates a single-page PDF resume from Markdown. The resume content is fictional sample data, keep it that way: never commit real personal data.

Two source resumes:

- `workshop/resume.md`
- `workshop/styled_resume.md`

Generated PDFs are created next to their source Markdown files and stay untracked:

- `workshop/resume.pdf`
- `workshop/styled_resume.pdf`

## Markdown to PDF

Preferred direct command for Markdown to PDF:

`npx --yes md-to-pdf <file>.md`

Preferred scripted command:

- `./scripts/build-pdf.sh workshop/resume.md`
- `./scripts/build-pdf.sh workshop/styled_resume.md`

## Continuous PDF Regeneration (Watcher)

Use the watcher to rebuild PDFs automatically on file changes:

`./scripts/watch-pdfs.sh`

Behavior:

- Runs an initial build for both resume files.
- Watches `workshop/resume.md` and `workshop/styled_resume.md`.
- Rebuilds only the changed file.
- Prints timestamped logs to stdout.
- Prints failures to stderr.

## PDF to Markdown

When converting a PDF resume to Markdown, use Markdownify MCP:

`mcp__markdownify__pdf-to-markdown`

Warning: output quality can vary; best for extracting raw text.

## Make Targets

Use `make` targets from the repository root:

- `make compare-contents`
  - Runs `validation/test_content_match.py`.
  - Strips styles/HTML from `workshop/styled_resume.md`.
  - Compares against `workshop/resume.md` with whitespace-insensitive comparison.
  - Generates:
    - `validation/artifacts/styled_resume_stripped.md`
    - `validation/artifacts/diff.txt`
  - Informational only: warns on content differences, does not fail on mismatch.
- `make generate-pdfs`
- `make watch-pdfs`
