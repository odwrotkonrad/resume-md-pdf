# Usage

## Setup

```bash
make install
```

Requires Ruby with bundler and a Chrome/Chromium binary (set `BROWSER_PATH` if not auto-detected).

## Sources

Two tracked source resumes, fictional sample data only:

- `example/resume.md`: raw resume text/content.
- `example/styled_resume.md`: same content with a CSS `<style>` block applied to both the PDF and the Markdown preview.

Generated PDFs are created next to their source Markdown files and stay untracked.

## Private Resume Data

Keep your real resume under `.user/input/` (gitignored, never tracked). Never commit real personal data. Build it the same way:

```bash
bundle exec ruby scripts/build_pdf.rb .user/input/resume.md
make generate-user-pdfs
```

## Markdown to PDF

```bash
bundle exec ruby scripts/build_pdf.rb example/resume.md
bundle exec ruby scripts/build_pdf.rb example/styled_resume.md
```

`scripts/build_pdf.rb` converts Markdown to HTML with kramdown, then prints to PDF via ferrum.

## Watcher

`bundle exec ruby scripts/watch_pdfs.rb` builds both resumes, then polls them and rebuilds the changed file, logging to stdout, failures to stderr.

## Validation

- `make compare-contents`: strips styles/HTML from `example/styled_resume.md`, compares against `example/resume.md` whitespace-insensitively, informational only. Artifacts land in `validation/artifacts/`.
- `make test-pdf`: asserts the generated `example/styled_resume.pdf`: exists, single page, sane size, expected content.

## CI

- `build-pdf`: renders `example/styled_resume.pdf`, exposed as a browsable artifact ("resume pdf preview") on MRs.
- `content-match`: informational content comparison.
- `pdf-assertions`: runs `validation/test_pdf.rb` against the built artifact.
- `validate-pre-commit-all`: re-runs the pre-commit docs generation and fails on drift.
