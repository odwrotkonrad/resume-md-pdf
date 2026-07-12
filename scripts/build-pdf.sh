#!/usr/bin/env bash
set -u

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <markdown-file>" >&2
  exit 1
fi

input_file="$1"
if [ ! -f "$input_file" ]; then
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: File not found: $input_file" >&2
  exit 1
fi

file_dir="$(dirname "$input_file")"
file_name="$(basename "$input_file")"

printf '[%s] Rebuilding %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$input_file"
if (
  cd "$file_dir" &&
  npx --yes md-to-pdf "$file_name"
); then
  printf '[%s] OK: Generated %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "${input_file%.md}.pdf"
else
  printf '[%s] ERROR: Failed to generate PDF for %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$input_file" >&2
  exit 1
fi
