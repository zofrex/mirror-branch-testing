#!/usr/bin/env ruby

require 'erb'
require 'securerandom'

unless ARGV.length == 1
  puts "::error file=update.rb::Expecting exactly one parameter. Usage: ./update.rb [tree-ish]"
  exit 1
end

@version = ARGV[0]

template = ERB.new(File.read('template.yml.erb'))
workflow = template.result()

File.write('.github/workflows/main.yml', workflow)
