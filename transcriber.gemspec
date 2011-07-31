# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "transcriber/version"

Gem::Specification.new do |s|
  s.name        = "Transcriber"
  s.version     = Transcriber::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Victor Rodrigues",              "William Yokoi"]
  s.email       = ["victorcrodrigues@gmail.com",    "thekina@gmail.com"]
  s.homepage    = "http://github.com/rodrigues/transcriber"
  s.summary     = %q{}
  s.description = %q{}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
