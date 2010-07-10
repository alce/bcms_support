require 'rubygems'
require 'rake'

begin
  begin
    require 'spec/rake/spectask'
  rescue LoadError
    puts "Rspec is not available. Itstall with sudo gem install rspec"
  end
  require 'jeweler'
  
  Jeweler::Tasks.new do |gem|
    gem.name = "bcms_support"
    gem.summary = %Q{Support for testing BrowserCMS modules}
    gem.description = %Q{Support for testing BrowserCMS modules}
    gem.email = "alce@mac.com"
    gem.homepage = "http://github.com/alce/bcms_test_support"
    gem.authors = ["Juan Alvarez"]
    gem.files = %w[LICENCE README.markdown Rakefile] + Dir.glob("{rails,lib,spec,seeds}/**/*")
    gem.add_development_dependency 'rspec'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

desc 'Default: run unit specs'
task :default => :spec

if defined? Spec
  desc 'Test bcms test support gem'
  Spec::Rake::SpecTask.new('spec') do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.spec_opts = ["-c"]
  end
  
  desc 'Test bcms test support gem'
  Spec::Rake::SpecTask.new('specdoc') do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.spec_opts = ["--format specdoc", "-c"]
  end
end
  
  

