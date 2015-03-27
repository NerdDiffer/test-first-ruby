# This Rakefile has all the right settings to run the tests inside each lab
gem 'rspec', '~>2'
require 'rspec/core/rake_task'

task :default => :spec

namespace :main do
  task :get_lab do
    lab = STDIN.gets.strip
    "#{lab}_*/*_spec.rb"
  end
end

desc "run tests for this lab"

RSpec::Core::RakeTask.new do |task|
  lab = Rake.application.original_dir
  task.pattern = "#{lab}/*_spec.rb"

  #task.pattern Rake::Task['main:get_lab'].invoke
  task.rspec_opts = [ "-I#{lab}", "-I#{lab}/solution", "-r ./rspec_config"]
  task.verbose = false
end
