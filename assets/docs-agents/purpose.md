# Purpose

## What It Is

Single-page PDF resume generator, Markdown in, styled PDF out, Ruby only: kramdown renders Markdown to HTML, ferrum drives headless Chrome to print it, pdf-reader and minitest assert the result. Tracked `example/` resumes are fictional sample data; real resumes live only under gitignored `.user/input/`.

## Why It Exists

A resume lives best as versioned Markdown, but hand-exporting it to a presentable PDF is manual and unrepeatable. This repo makes the export one command, keeps the styling in plain CSS, and keeps real personal data out of the repository.

## Goals

- One command from Markdown to a styled single-page PDF.
- Ruby-only toolchain: no Python, no JavaScript.
- Real resume data never tracked: `.user/input/` only, fictional data in `example/`.
- CI builds a browsable PDF preview artifact and asserts it: single page, sane size, expected content.
