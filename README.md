# resume-md-pdf

Generates a single-page PDF resume from Markdown, Ruby only: kramdown renders the Markdown, ferrum drives headless Chrome for the PDF. The resume content in `example/` is fictional sample data.

## Setup

```bash
make install
```

Requires Ruby with bundler and a Chrome/Chromium binary (set `BROWSER_PATH` if not auto-detected).

## Private resume data

Keep your real resume under `.user/input/` (gitignored, never tracked). Build it the same way:

```bash
bundle exec ruby scripts/build_pdf.rb .user/input/resume.md
make generate-user-pdfs
```

## Editing workflow

- Edit `example/resume.md` for raw resume text/content.
- Edit `example/styled_resume.md` when you want styles applied to both:
  - The generated PDF
  - The Markdown preview
- Write styles in CSS.

## Generate PDF once

From the repository root, run:

```bash
bundle exec ruby scripts/build_pdf.rb example/resume.md
bundle exec ruby scripts/build_pdf.rb example/styled_resume.md
```

## Watch and auto-regenerate PDFs

To continuously watch both Markdown files and regenerate PDFs on every save:

```bash
bundle exec ruby scripts/watch_pdfs.rb
```

Watched files:

- `example/resume.md`
- `example/styled_resume.md`

Output:

- Initial build for both files when watcher starts
- Timestamped stdout logs for each rebuild
- Error logs to stderr if generation fails

## Make targets

```bash
make install
make generate-pdfs
make generate-user-pdfs
make watch-pdfs
make compare-contents
make test-pdf
```

`compare-contents` strips styles/HTML from `example/styled_resume.md` and compares it against `example/resume.md`, whitespace-insensitive, informational only. `test-pdf` asserts the generated `example/styled_resume.pdf`: exists, single page, sane size, expected content. Artifacts land in `validation/artifacts/`.

## CI

- `build-pdf`: renders `example/styled_resume.pdf`, exposed as a browsable artifact ("resume pdf preview") on MRs.
- `content-match`: informational content comparison.
- `pdf-assertions`: runs `validation/test_pdf.rb` against the built artifact.
