# resume-md-pdf

Generates a single-page PDF resume from Markdown. The resume content in `example/` is fictional sample data.

## Private resume data

Keep your real resume under `.user/input/` (gitignored, never tracked). Build it the same way:

```bash
./scripts/build-pdf.sh .user/input/resume.md
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
./scripts/build-pdf.sh example/resume.md
./scripts/build-pdf.sh example/styled_resume.md
```

This uses:

```bash
npx --yes md-to-pdf <file>.md
```

## Watch and auto-regenerate PDFs

To continuously watch both Markdown files and regenerate PDFs on every save:

```bash
./scripts/watch-pdfs.sh
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
make generate-pdfs
make watch-pdfs
make compare-contents
```

`compare-contents` strips styles/HTML from `example/styled_resume.md` and compares it against `example/resume.md`, whitespace-insensitive, informational only. Artifacts land in `validation/artifacts/`.
