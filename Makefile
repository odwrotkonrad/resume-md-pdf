##[>] 🤖🤖
#[what] Project's Makefile
SHELL := zsh
.SHELLFLAGS := -c

WRAPPERS :=
COMMANDS := generate-pdfs generate-user-pdfs watch-pdfs compare-contents

.PHONY: $(WRAPPERS) $(COMMANDS)

##[>] PDF [genai-include]
#[what] render example/resume.md and example/styled_resume.md to PDF via md-to-pdf
generate-pdfs:
	@./scripts/build-pdf.sh example/resume.md
	@./scripts/build-pdf.sh example/styled_resume.md

#[what] render every private resume under .user/input/ to PDF via md-to-pdf
generate-user-pdfs:
	@for f in .user/input/*.md(N); do ./scripts/build-pdf.sh $$f; done

#[what] watch both markdown sources, regenerate PDFs on save
watch-pdfs:
	@./scripts/watch-pdfs.sh
##[<] PDF

##[>] Validation [genai-include]
#[what] compare styled resume content against plain resume (informational)
compare-contents:
	@python3 -m pytest -s validation/test_content_match.py
##[<] Validation
##[<] 🤖🤖
