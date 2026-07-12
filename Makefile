##[>] 🤖🤖
#[what] Project's Makefile
SHELL := zsh
.SHELLFLAGS := -c

WRAPPERS :=
COMMANDS := install generate-pdfs generate-user-pdfs watch-pdfs compare-contents test-pdf

.PHONY: $(WRAPPERS) $(COMMANDS)

##[>] Setup [genai-include]
#[what] install ruby gem dependencies
install:
	@bundle install

##[<] Setup

##[>] PDF [genai-include]
#[what] render example/resume.md and example/styled_resume.md to PDF
generate-pdfs:
	@bundle exec ruby scripts/build_pdf.rb example/resume.md
	@bundle exec ruby scripts/build_pdf.rb example/styled_resume.md

#[what] render every private resume under .user/input/ to PDF
generate-user-pdfs:
	@for f in .user/input/*.md(N); do bundle exec ruby scripts/build_pdf.rb $$f; done

#[what] watch both markdown sources, regenerate PDFs on save
watch-pdfs:
	@bundle exec ruby scripts/watch_pdfs.rb
##[<] PDF

##[>] Validation [genai-include]
#[what] compare styled resume content against plain resume (informational)
compare-contents:
	@bundle exec ruby validation/test_content_match.rb

#[what] assert the generated styled resume PDF (exists, one page, expected content)
test-pdf:
	@bundle exec ruby validation/test_pdf.rb
##[<] Validation
##[<] 🤖🤖
