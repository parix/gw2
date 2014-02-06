desc "Open an irb session preloaded with this library"
task :console do
    ENV["RUBY_ENV"] ||= "development"
    sh "irb -I lib -r gw2"
end

require "bundler/gem_tasks"
