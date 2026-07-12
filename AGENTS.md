# AGENTS Guide

## Project Scope

This repository generates a single-page PDF resume from Markdown, Ruby only (kramdown + ferrum + pdf-reader + minitest): no Python, no JavaScript. Tracked resume content is fictional sample data, keep it that way: never commit real personal data. Real resumes live only under `.user/input/` (gitignored), built with the same scripts or `make generate-user-pdfs`.

Two tracked source resumes:

- `example/resume.md`
- `example/styled_resume.md`

Generated PDFs are created next to their source Markdown files and stay untracked:

- `example/resume.pdf`
- `example/styled_resume.pdf`

## Markdown to PDF

Preferred command:

- `bundle exec ruby scripts/build_pdf.rb example/resume.md`
- `bundle exec ruby scripts/build_pdf.rb example/styled_resume.md`

`scripts/build_pdf.rb` converts Markdown to HTML with kramdown, then prints to PDF via ferrum (headless Chrome, `BROWSER_PATH` overrides the binary).

## Continuous PDF Regeneration (Watcher)

Use the watcher to rebuild PDFs automatically on file changes:

`bundle exec ruby scripts/watch_pdfs.rb`

Behavior:

- Runs an initial build for both resume files.
- Polls `example/resume.md` and `example/styled_resume.md`.
- Rebuilds only the changed file.
- Prints timestamped logs to stdout.
- Prints failures to stderr.

## Make Targets

Use `make` targets from the repository root:

- `make install`
  - Runs `bundle install`.
- `make compare-contents`
  - Runs `validation/test_content_match.rb`.
  - Strips styles/HTML from `example/styled_resume.md`.
  - Compares against `example/resume.md` with whitespace-insensitive comparison.
  - Generates:
    - `validation/artifacts/styled_resume_stripped.md`
    - `validation/artifacts/diff.txt`
  - Informational only: warns on content differences, does not fail on mismatch.
- `make test-pdf`
  - Runs `validation/test_pdf.rb`: PDF exists, single page, sane size, expected content.
- `make generate-pdfs`
- `make generate-user-pdfs`
- `make watch-pdfs`
