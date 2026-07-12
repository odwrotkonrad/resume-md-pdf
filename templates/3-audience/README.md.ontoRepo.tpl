# resume-md-pdf

Single-page PDF resume from Markdown.

## Happy Path

Put your resume Markdown under `.user/input/` (gitignored, never tracked), then:

```bash
make install
make generate-user-pdfs
```

The PDF lands next to its Markdown source. Style it by prepending a CSS `<style>` block to the Markdown, see `example/styled_resume.md`. Tracked `example/` resumes are fictional sample data, rendered with `make generate-pdfs`.

All targets: [assets/data/makefile.agents.md](assets/data/makefile.agents.md).

{{ renderMarkdown "assets/docs-agents/purpose.md" "strip-comments" "normalize-headings" }}
