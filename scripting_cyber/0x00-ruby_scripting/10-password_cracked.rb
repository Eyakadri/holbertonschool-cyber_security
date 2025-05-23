#!/usr/bin/env ruby
require 'digest'

# Check arguments
if ARGV.length != 2
  puts "Usage: #{__FILE__} HASHED_PASSWORD DICTIONARY_FILE"
  exit 1
end

hashed_password, dictionary_file = ARGV

# Read the dictionary and try to match hashes
begin
  File.foreach(dictionary_file) do |line|
    word = line.strip
    hash = Digest::SHA256.hexdigest(word)
    if hash == hashed_password
      puts "Password found: #{word}"
      exit 0
    end
  end

  puts "Password not found in dictionary."
rescue Errno::ENOENT
  puts "Dictionary file not found."
rescue => e
  puts "Error: #{e.message}"
end
