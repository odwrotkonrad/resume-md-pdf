##[>] 🤖🤖
SHELL := zsh
.SHELLFLAGS := -c

COMMANDS := che-install generic-setup install repo-prepare-deps generate-pdfs generate-example-pdfs watch-pdfs compare-contents test-pdf

.PHONY: $(COMMANDS)

-include shared/generic/make/generic.mk

##[>] Setup [genai-include]
#[what] install the latest released che into ~/.local/bin, only when the one on PATH is older
che-install:
	@curl -fsSL https://konradodwrot.gitlab.io/go-modules/che-install.sh | sh -s -- --skip-if-present-is-newer

#[what] render the generic consumer payload (generic.mk, lefthook.yml, shared/generic/) at the pinned CENTRALIZED_ASSETS_GENERIC_REF
generic-setup:
	@$${CHE_BIN:-che} render-templates --profiles=genericSetup

shared/generic/make/generic.mk: generic-setup

#[what] install ruby gem dependencies (needs ruby + bundler; PDF rendering needs Chrome/Chromium, override binary via BROWSER_PATH)
#[why] --path vendor/bundle, not a bare `bundle install`: .bundle/config carries that setting but is
#   gitignored, so a fresh clone would install into the system gem dir and fail without root
install:
	@bundle config set --local path vendor/bundle
	@bundle install

#[why] the repo declares ruby in its devEnv profile, so no host or image has to carry it in advance
#[what] install this repo's toolchain, then its dependencies
#[why] debian's ruby ships bundler only as the versioned `bundle3.1`, so a plain `bundle` is missing
#   on a fresh image even though the gem is present: install it as a user gem to get the unversioned
#   binary, and put the gem bindir on PATH for the install that follows
repo-prepare-deps:
	@che run --profiles=devEnv
	@command -v bundle >/dev/null || gem install --user-install --no-document bundler
	@PATH="$$(gem environment gemdir 2>/dev/null)/bin:$$(ruby -e 'print Gem.user_dir' 2>/dev/null)/bin:$$PATH" $(MAKE) install
##[<] Setup

##[>] PDF [genai-include]
#[what] render every private resume under .user/input/ (gitignored, never commit real data) to PDF in .user/output/
generate-pdfs:
	@for f in .user/input/*.md(N); do bundle exec ruby scripts/build_pdf.rb $$f .user/output; done

#[what] render example/resume.md and example/styled_resume.md to PDF
generate-example-pdfs:
	@bundle exec ruby scripts/build_pdf.rb example/resume.md
	@bundle exec ruby scripts/build_pdf.rb example/styled_resume.md

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
##[<] 🤖🤖
