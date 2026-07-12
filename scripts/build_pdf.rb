##[>] 🤖🤖
require "ferrum"
require "kramdown"
require "pathname"
require "tmpdir"

abort "Usage: ruby scripts/build_pdf.rb <markdown-file>" unless ARGV.size == 1

src = Pathname.new(ARGV[0])
abort "[#{Time.now.strftime('%F %T')}] ERROR: File not found: #{src}" unless src.file?

out = src.sub_ext(".pdf")
puts "[#{Time.now.strftime('%F %T')}] Rebuilding #{src}"

body = Kramdown::Document.new(src.read).to_html
html = <<~HTML
  <!DOCTYPE html>
  <html>
  <head><meta charset="utf-8"></head>
  <body>#{body}</body>
  </html>
HTML

Dir.mktmpdir do |dir|
  html_path = File.join(dir, "#{src.basename('.md')}.html")
  File.write(html_path, html)

  browser = Ferrum::Browser.new(
    headless: true,
    timeout: 60,
    browser_path: ENV["BROWSER_PATH"],
    browser_options: { "no-sandbox" => nil, "disable-dev-shm-usage" => nil }
  )
  begin
    page = browser.create_page
    page.go_to("file://#{html_path}")
    begin
      page.network.wait_for_idle(timeout: 10)
    rescue Ferrum::TimeoutError
    end
    page.pdf(path: out.to_s, prefer_css_page_size: true, print_background: true)
  ensure
    browser.quit
  end
end

puts "[#{Time.now.strftime('%F %T')}] OK: Generated #{out}"
##[<] 🤖🤖
