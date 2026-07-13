##[>] 🤖🤖
require "minitest/autorun"
require "pathname"
require "pdf-reader"

class TestPdf < Minitest::Test
  ROOT = Pathname.new(__dir__).parent
  PDF_PATH = ROOT / "example" / "styled_resume.pdf"
  MAX_BYTES = 5 * 1024 * 1024
  EXPECTED_SNIPPETS = ["Alex Nowak", "Experience", "Skills", "Education"].freeze

  def reader
    @reader ||= PDF::Reader.new(PDF_PATH.to_s)
  end

  def test_pdf_exists_and_sized
    assert_path_exists PDF_PATH, "missing generated PDF: #{PDF_PATH}"
    size = PDF_PATH.size
    assert size > 10_000, "suspiciously small PDF: #{size} bytes"
    assert size < MAX_BYTES, "suspiciously large PDF: #{size} bytes"
  end

  def test_pdf_is_single_page
    assert_equal 1, reader.page_count, "expected 1 page, got #{reader.page_count}"
  end

  def test_pdf_contains_expected_content
    text = reader.pages.map(&:text).join("\n").downcase
    missing = EXPECTED_SNIPPETS.reject { |s| text.include?(s.downcase) }
    assert_empty missing, "missing snippets in PDF text: #{missing}"
  end
end
##[<] 🤖🤖
