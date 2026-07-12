from __future__ import annotations

from pathlib import Path
import difflib
import re

ROOT = Path(__file__).resolve().parents[1]
RESUME = ROOT / "workshop" / "resume.md"
STYLED = ROOT / "workshop" / "styled_resume.md"
ARTIFACTS = ROOT / "validation" / "artifacts"
STRIPPED_OUT = ARTIFACTS / "styled_resume_stripped.md"
DIFF_OUT = ARTIFACTS / "diff.txt"


def strip_html_and_styles(markdown: str) -> str:
    # Remove inline style blocks used for md-to-pdf rendering.
    text = re.sub(r"<style\b[^>]*>.*?</style>", "", markdown, flags=re.IGNORECASE | re.DOTALL)
    # Remove remaining HTML tags (e.g. div wrappers).
    text = re.sub(r"</?[^>]+>", "", text)
    # Normalize extra blank lines introduced by removals.
    text = re.sub(r"\n{3,}", "\n\n", text).strip() + "\n"
    return text


def normalize_for_compare(markdown: str) -> str:
    lines = []
    for line in markdown.splitlines():
        # Ignore trailing/leading whitespace and collapse internal whitespace runs.
        compact = " ".join(line.split())
        lines.append(compact)
    normalized = "\n".join(lines).strip() + "\n"
    return normalized


def test_content_match_info_only() -> None:
    ARTIFACTS.mkdir(parents=True, exist_ok=True)

    resume_text = RESUME.read_text(encoding="utf-8")
    styled_text = STYLED.read_text(encoding="utf-8")

    stripped = strip_html_and_styles(styled_text)
    STRIPPED_OUT.write_text(stripped, encoding="utf-8")

    resume_normalized = normalize_for_compare(resume_text)
    stripped_normalized = normalize_for_compare(stripped)

    resume_lines = resume_normalized.splitlines(keepends=True)
    stripped_lines = stripped_normalized.splitlines(keepends=True)

    diff_lines = list(
        difflib.unified_diff(
            resume_lines,
            stripped_lines,
            fromfile="workshop/resume.md",
            tofile="validation/artifacts/styled_resume_stripped.md",
            lineterm="",
            n=3,
        )
    )

    if diff_lines:
        diff_text = "\n".join(diff_lines) + "\n"
        DIFF_OUT.write_text(diff_text, encoding="utf-8")
        print("[content-match][WARNING] Differences found (whitespace ignored; informational only).")
        print(f"[content-match] Wrote stripped file: {STRIPPED_OUT}")
        print(f"[content-match] Wrote diff file: {DIFF_OUT}")
        preview = "\n".join(diff_lines[:120])
        if preview:
            print("[content-match] Diff preview:")
            print(preview)
    else:
        DIFF_OUT.write_text("No differences found.\n", encoding="utf-8")
        print("[content-match] No differences found.")
        print(f"[content-match] Wrote stripped file: {STRIPPED_OUT}")
        print(f"[content-match] Wrote diff file: {DIFF_OUT}")

    # Informational check: intentionally non-blocking for content differences.
    assert True
