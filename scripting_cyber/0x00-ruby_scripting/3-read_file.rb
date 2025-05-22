#!/usr/bin/env ruby
require 'json'

def count_user_ids(path)
  counts = Hash.new(0)
  File.open(path) do |f|
    JSON.parse(f.read).each { |e| counts[e['userId']] += 1 }
  end
  counts.each { |id, count| puts "#{id}: #{count}" }
end
