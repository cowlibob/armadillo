require 'rake/testtask'
require 'minitest/colorize'

task :default => [:test]

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
  t.verbose = true
end