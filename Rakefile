require 'rake'
require 'spec/rake/spectask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = 'libgeohash'
    gemspec.summary = 'Ruby FFI wrapper for libgeohash'
    gemspec.description = gemspec.summary
    gemspec.email = 'ilya@igvita.com'
    gemspec.homepage = 'http://github.com/igrigorik/libgeohash'
    gemspec.authors = ['Ilya Grigorik']
    gemspec.rubyforge_project = gemspec.name
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts 'Jeweler not available. Install it with: sudo gem install jeweler -s http://gemcutter.org'
end

task :default => :spec

Spec::Rake::SpecTask.new do |t|
  t.ruby_opts = ['-rtest/unit']
  t.spec_files = FileList['spec/**/*_spec.rb']
end

