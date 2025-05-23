#!/usr/bin/env ruby
require 'open-uri'
require 'json'

def get_request(url)
  begin
    content = URI.open(url)
    status_line = content.status.join(' ')
    body = content.read

    puts "Response status: #{status_line}"
    puts "Response body:"

    if body.strip.empty?
      puts "{}"
    else
      begin
        json = JSON.parse(body)
        puts JSON.pretty_generate(json)
      rescue JSON::ParserError
        puts "{}"
      end
    end
  rescue OpenURI::HTTPError => e
    status_line = e.io.status.join(' ')
    puts "Response status: #{status_line}"
    puts "Response body:"
    puts "{}"
  end
end
