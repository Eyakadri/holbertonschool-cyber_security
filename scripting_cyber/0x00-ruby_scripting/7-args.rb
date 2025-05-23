#!/usr/bin/env ruby
def print_arguments
  return puts "No arguments provided." if ARGV.empty?

  ARGV.each_with_index { |arg, i| puts "#{i + 1}. #{arg}" }
end
