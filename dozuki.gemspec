# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dozuki/version"

Gem::Specification.new do |s|
  s.name        = "dozuki"
  s.version     = Dozuki::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["James Almond"]
  s.email       = ["james@jamesalmond.com"]
  s.homepage    = "https://github.com/jamesalmond/dozuki"
  s.summary     = %q{An XPath syntactic sugar wrapper for Nokogiri}
  s.description = %q{A simple way of extracting various elements from an XML document using XPaths}

  s.rubyforge_project = "dozuki"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/* .autotest`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("nokogiri")

  s.add_development_dependency("rspec")
  s.add_development_dependency("cucumber")
  s.add_development_dependency("ruby-debug19")
  s.add_development_dependency("autotest")

end
