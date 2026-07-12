#!/usr/bin/env bash
set -euo pipefail

FILES=(
  "workshop/resume.md"
  "workshop/styled_resume.md"
)

printf '[%s] Initial PDF build started\n' "$(date '+%Y-%m-%d %H:%M:%S')"
for file in "${FILES[@]}"; do
  ./scripts/build-pdf.sh "$file"
done

printf '[%s] Watching for changes in: %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "${FILES[*]}"
printf '[%s] Waiting for file changes...\n' "$(date '+%Y-%m-%d %H:%M:%S')"

npx --yes chokidar-cli "${FILES[@]}" --debounce 200 --command './scripts/build-pdf.sh "{path}"'
