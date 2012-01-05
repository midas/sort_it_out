# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sort_it_out/version"

Gem::Specification.new do |s|
  s.name        = "sort_it_out"
  s.version     = SortItOut::VERSION
  s.authors     = ["C. Jason Harrelson"]
  s.email       = ["jason@lookforwardenterprises.com"]
  s.homepage    = "https://github.com/midas/sort_it_out"
  s.summary     = %q{Easily apply sorting to your Rails controller actions.}
  s.description = %q{Easily apply sorting to your Rails controller actions.}

  s.rubyforge_project = "sort_it_out"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  %w(
    gem-dandy
    rspec
    ruby-debug
    guard
    rb-fsevent
    growl
    guard-rspec
  ).each do |development_dependency|
    s.add_development_dependency development_dependency
  end

  # s.add_runtime_dependency "rest-client"
end
