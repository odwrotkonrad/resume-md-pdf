# Purpose

## What It Is

Single-page PDF resume generator, Markdown in, styled PDF out, Ruby only: kramdown renders Markdown to HTML, ferrum drives headless Chrome to print it, pdf-reader and minitest assert the result. The tracked `example/` resumes are fictional. Real ones live only under gitignored `.user/input/`.

## Why It Exists

A resume belongs in versioned Markdown, but hand-exporting a presentable PDF is unrepeatable. This repo makes the export one command: styling in plain CSS, real personal data never in the repo.

## Goals

- One command from Markdown to a styled single-page PDF.
- Ruby-only toolchain: no Python, no JavaScript.
- Real resume data never tracked: `.user/input/` only, fictional data in `example/`.
- CI builds a browsable PDF preview artifact and asserts it: single page, sane size, expected content.
