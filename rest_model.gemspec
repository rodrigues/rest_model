# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rest_model/version"

Gem::Specification.new do |s|
  s.name        = "rest_model"
  s.version     = RestModel::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Victor Rodrigues",           "Vinicius Higa",                "William Yokoi"]
  s.email       = ["victorcrodrigues@gmail.com", "vinicius.higa@locaweb.com.br", "thekina@gmail.com"]
  s.homepage    = "http://github.com/rodrigues/rest_model"
  s.summary     = %q{}
  s.description = %q{}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "activesupport", "~> 3.0"
  s.add_dependency "i18n",          ">= 0.5"
  s.add_development_dependency "rspec",       "~> 2.6"
  s.add_development_dependency "guard",       "~> 0.5"
  s.add_development_dependency "guard-rspec", "~> 0.4"
  s.add_development_dependency "growl",       "~> 1.0"
end
