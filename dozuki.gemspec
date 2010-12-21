# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dozuki/version"

Gem::Specification.new do |s|
  s.name        = "dozuki"
  s.version     = Dozuki::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["James Almond"]
  s.email       = ["james@jamesalmond.com"]
  s.homepage    = "http://jamesalmond.com"
  s.summary     = %q{A small syntax sugar wrapper over Nokogiri}
  s.description = %q{This gem was created to remove repetitive tasks from parsing documents using XPath and Nokogiri }

  s.rubyforge_project = "dozuki"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features,autotest}/* .autotest`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency("nokogiri")
  
  s.add_development_dependency("rspec")
  s.add_development_dependency("cucumber")
  s.add_development_dependency("ruby-debug19")
  s.add_development_dependency("autotest")
  
end
