require 'rspec/core/rake_task'
require 'kitchen/rake_tasks'

RSpec::Core::RakeTask.new(:spec)
Kitchen::RakeTasks.new

task default: [:spec, 'kitchen:all']
