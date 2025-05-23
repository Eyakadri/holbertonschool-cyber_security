#!/usr/bin/env ruby
require 'open-uri'
require 'uri'
require 'fileutils'

# Check if correct number of arguments are given
if ARGV.length != 2
  puts "Usage: #{__FILE__} URL LOCAL_FILE_PATH"
  exit 1
end

url, path = ARGV

begin
  puts "Downloading file from #{url}..."
  URI.open(url) do |remote_file|
    FileUtils.mkdir_p(File.dirname(path)) unless File.directory?(File.dirname(path))
    File.open(path, 'wb') do |file|
      file.write(remote_file.read)
    end
  end
  puts "File downloaded and saved to #{path}."
rescue OpenURI::HTTPError => e
  puts "HTTP error: #{e.message}"
rescue StandardError => e
  puts "Failed to download file: #{e.message}"
end
