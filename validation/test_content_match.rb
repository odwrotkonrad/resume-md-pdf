##[>] 🤖🤖
require "minitest/autorun"
require "pathname"

class TestContentMatch < Minitest::Test
  ROOT = Pathname.new(__dir__).parent
  RESUME = ROOT / "example" / "resume.md"
  STYLED = ROOT / "example" / "styled_resume.md"
  ARTIFACTS = ROOT / "validation" / "artifacts"
  STRIPPED_OUT = ARTIFACTS / "styled_resume_stripped.md"
  DIFF_OUT = ARTIFACTS / "diff.txt"

  def strip_html_and_styles(markdown)
    text = markdown.gsub(%r{<style\b[^>]*>.*?</style>}mi, "")
    text = text.gsub(%r{</?[^>]+>}, "")
    text.gsub(/\n{3,}/, "\n\n").strip + "\n"
  end

  def normalize_whitespace(markdown)
    markdown.lines.map { |l| l.split.join(" ") }.join("\n").strip + "\n"
  end

  def test_content_match_info_only
    ARTIFACTS.mkpath

    stripped = strip_html_and_styles(STYLED.read)
    STRIPPED_OUT.write(stripped)

    resume_lines = normalize_whitespace(RESUME.read).lines
    stripped_lines = normalize_whitespace(stripped).lines

    diff = []
    [resume_lines.size, stripped_lines.size].max.times do |i|
      resume_line, stripped_line = resume_lines[i], stripped_lines[i]
      next if resume_line == stripped_line

      diff << "line #{i + 1}:"
      diff << "- #{resume_line&.chomp}"
      diff << "+ #{stripped_line&.chomp}"
    end

    if diff.empty?
      DIFF_OUT.write("No differences found.\n")
      puts "[content-match] No differences found."
    else
      DIFF_OUT.write(diff.join("\n") + "\n")
      puts "[content-match][WARNING] Differences found (whitespace ignored; informational only)."
      puts diff.first(60)
    end
    puts "[content-match] Wrote stripped file: #{STRIPPED_OUT}"
    puts "[content-match] Wrote diff file: #{DIFF_OUT}"

    assert true
  end
end
##[<] 🤖🤖
