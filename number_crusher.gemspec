# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "number_crusher/version"

Gem::Specification.new do |spec|
  spec.name = "number_crusher"
  spec.version = NumberCrusher::VERSION
  spec.authors = ["Ronie Uliana"]
  spec.email = ["ronie.uliana@gmail.com"]

  spec.summary = "Statistics for ruby. Torture number until they confess"
  spec.description = <<TEXT
Statistical methods and functions for Ruby.
A minor (and improving) collection of everything I need
to crush numbers in my job. (Currently, only nonparametric
statistics)
TEXT
  spec.homepage = "https://github.com/VAGAScom/number_crusher"

  spec.files = `git ls-files -z`.
    split("\x0").
    reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "guard-rspec", "~> 4.5"
  spec.add_development_dependency "guard-rubocop", "~> 1.2"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "travis", "~> 1.7.6"
end
