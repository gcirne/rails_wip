# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rails_wip/version"

Gem::Specification.new do |s|
  s.name        = "rails_wip"
  s.version     = RailsWip::VERSION
  s.authors     = ["Guilherme Cirne"]
  s.email       = ["gcirne@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Very crude (no, really, I mean very crude!) feature toggle for rails apps.}
  s.description = %q{Very crude (no, really, I mean very crude!) feature toggle for rails apps.}

  s.rubyforge_project = "rails_wip"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "rails", "~> 3.0"

  s.add_development_dependency "capybara"
  s.add_development_dependency "rspec-rails"
end
