##[>] 🤖🤖
#[what] Project's Makefile
SHELL := zsh
.SHELLFLAGS := -c

WRAPPERS :=
COMMANDS := render-templates install generate-pdfs generate-user-pdfs watch-pdfs compare-contents test-pdf run-repo-ci-prepare-hooks run-repo-ci-precommit-all

.PHONY: $(WRAPPERS) $(COMMANDS)

##[>] Docs [genai-include]
#[what] render *.ontoRepo.tpl onto the repo (makefile.agents.md, repo-structure.md, CLAUDE.md, AGENTS.md, README.md)
render-templates:
	@che render-templates
##[<] Docs

##[>] Setup [genai-include]
#[what] install ruby gem dependencies (needs ruby + bundler; PDF rendering needs Chrome/Chromium, override binary via BROWSER_PATH)
install:
	@bundle install

##[<] Setup

##[>] PDF [genai-include]
#[what] render example/resume.md and example/styled_resume.md to PDF
generate-pdfs:
	@bundle exec ruby scripts/build_pdf.rb example/resume.md
	@bundle exec ruby scripts/build_pdf.rb example/styled_resume.md

#[what] render every private resume under .user/input/ (gitignored, never commit real data) to PDF
generate-user-pdfs:
	@for f in .user/input/*.md(N); do bundle exec ruby scripts/build_pdf.rb $$f; done

#[what] watch both example markdown sources, regenerate PDFs on save
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

##[>] CI [genai-include]
#[what] install lefthook git hooks
run-repo-ci-prepare-hooks:
	@lefthook install --force

#[what] run pre-commit hooks over all files (not just staged)
run-repo-ci-precommit-all: run-repo-ci-prepare-hooks
	@lefthook run pre-commit --all-files --force
##[<] CI
##[<] 🤖🤖
