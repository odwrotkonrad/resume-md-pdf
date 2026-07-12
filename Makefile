##[>] 🤖🤖
#[what] Project's Makefile
SHELL := zsh
.SHELLFLAGS := -c

WRAPPERS :=
COMMANDS := generate-pdfs watch-pdfs compare-contents

.PHONY: $(WRAPPERS) $(COMMANDS)

##[>] PDF [genai-include]
#[what] render workshop/resume.md and workshop/styled_resume.md to PDF via md-to-pdf
generate-pdfs:
	@./scripts/build-pdf.sh workshop/resume.md
	@./scripts/build-pdf.sh workshop/styled_resume.md

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
