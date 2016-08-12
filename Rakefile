# coding: utf-8
task :default => [:build]

require "yui/compressor"
require "html_compressor"

desc "Minify CSS"
task :minify_css do
  puts "## Minifying CSS"
  compressor = YUI::CssCompressor.new
  Dir.glob("_site/**/*.css").each do |name|
    puts "Minifying #{name}"
    input = File.read(name)
    output = File.open("#{name}", "w")
    output << compressor.compress(input)
    output.close
  end
end

desc "Minify JS"
task :minify_js do
  puts "## Minifying JS"
  compressor = YUI::JavaScriptCompressor.new
  Dir.glob("_site/**/*.js").each do |name|
    puts "Minifying #{name}"
    input = File.read(name)
    output = File.open("#{name}", "w")
    output << compressor.compress(input)
    output.close
  end
end

desc "Minify HTML"
task :minify_html do
  puts "## Minifying HTML"
  compressor = HtmlCompressor::HtmlCompressor.new
  Dir.glob("_site/**/*.html").each do |name|
    puts "Minifying #{name}"
    input = File.read(name)
    output = File.open("#{name}", "w")
    output << compressor.compress(input)
    output.close
  end
end

task :build do
	system("bundle exec jekyll build")
  # Apply minification tasks
  Rake::Task[:minify_css].execute
  Rake::Task[:minify_js].execute
  Rake::Task[:minify_html].execute

  Rake::Task[:copydot].invoke(source_dir, public_dir)
  Rake::Task["#{deploy_default}"].execute
end
