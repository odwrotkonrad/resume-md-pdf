##[>] 🤖🤖
FILES = ["example/resume.md", "example/styled_resume.md"].freeze

def build(file)
  system("bundle", "exec", "ruby", "scripts/build_pdf.rb", file) ||
    warn("[#{Time.now.strftime('%F %T')}] ERROR: Failed to generate PDF for #{file}")
end

puts "[#{Time.now.strftime('%F %T')}] Initial PDF build started"
FILES.each { |f| build(f) }

puts "[#{Time.now.strftime('%F %T')}] Watching for changes in: #{FILES.join(' ')}"
mtimes = FILES.to_h { |f| [f, File.mtime(f)] }
loop do
  sleep 0.5
  FILES.each do |f|
    mtime = File.mtime(f)
    next if mtime == mtimes[f]

    mtimes[f] = mtime
    build(f)
  end
end
##[<] 🤖🤖
