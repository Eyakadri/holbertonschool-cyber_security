#!/usr/bin/env ruby
require 'open-uri'
require 'json'

def get_request(url)
  begin
    content = URI.open(url)
    status_line = content.status.join(' ')
    puts "Response status: #{status_line}"
    puts "Response body:"
    json = JSON.parse(content.read)
    puts JSON.pretty_generate(json)
  rescue OpenURI::HTTPError => e
    puts "HTTP Request failed: #{e.message}"
  rescue JSON::ParserError
    puts "Response is not valid JSON."
  end
end
