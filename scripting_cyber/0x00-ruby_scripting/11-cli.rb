#!/usr/bin/env ruby
require 'optparse'
require 'fileutils'

TASK_FILE = 'tasks.txt'

# Ensure the task file exists
FileUtils.touch(TASK_FILE)

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"

  opts.on('-a', '--add TASK', 'Add a new task') do |task|
    options[:add] = task
  end

  opts.on('-l', '--list', 'List all tasks') do
    options[:list] = true
  end

  opts.on('-r', '--remove INDEX', Integer, 'Remove a task by index') do |index|
    options[:remove] = index
  end

  opts.on('-h', '--help', 'Show help') do
    puts opts
    exit
  end
end.parse!

# Perform actions based on options
if options[:add]
  File.open(TASK_FILE, 'a') { |file| file.puts(options[:add]) }
  puts "Task '#{options[:add]}' added."

elsif options[:list]
  tasks = File.readlines(TASK_FILE, chomp: true)
  if tasks.empty?
    puts "No tasks found."
  else
    tasks.each_with_index do |task, i|
      puts "#{i + 1}. #{task}"
    end
  end

elsif options[:remove]
  tasks = File.readlines(TASK_FILE, chomp: true)
  index = options[:remove] - 1
  if index.between?(0, tasks.size - 1)
    removed = tasks.delete_at(index)
    File.write(TASK_FILE, tasks.join("\n") + "\n")
    puts "Task '#{removed}' removed."
  else
    puts "Invalid index. No task removed."
  end

elsif options.empty?
  puts "Use -h for help."
end
