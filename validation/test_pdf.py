##[>] 🤖🤖
from __future__ import annotations

from pathlib import Path

from pypdf import PdfReader

ROOT = Path(__file__).resolve().parents[1]
PDF = ROOT / "example" / "styled_resume.pdf"
MAX_BYTES = 5 * 1024 * 1024
EXPECTED_SNIPPETS = ["Alex Nowak", "Experience", "Skills", "Education"]


def test_pdf_exists_and_sized() -> None:
    assert PDF.is_file(), f"missing generated PDF: {PDF}"
    size = PDF.stat().st_size
    assert 10_000 < size < MAX_BYTES, f"suspicious PDF size: {size} bytes"


def test_pdf_is_single_page() -> None:
    reader = PdfReader(PDF)
    assert len(reader.pages) == 1, f"expected 1 page, got {len(reader.pages)}"


def test_pdf_contains_expected_content() -> None:
    reader = PdfReader(PDF)
    text = "\n".join(page.extract_text() or "" for page in reader.pages).lower()
    missing = [s for s in EXPECTED_SNIPPETS if s.lower() not in text]
    assert not missing, f"missing snippets in PDF text: {missing}"
##[<] 🤖🤖
