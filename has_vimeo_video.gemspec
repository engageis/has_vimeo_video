# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "has_vimeo_video/version"

Gem::Specification.new do |s|

  s.name        = "has_vimeo_video"
  s.version     = HasVimeoVideo::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Engage"]
  s.email       = ["what@engage.is"]
  s.homepage    = ""
  s.summary     = %q{Adds Vimeo integration to ActiveRecord}
  s.description = %q{Adds video URL validation and API integration for using Vimeo on ActiveRecord}

  s.rubyforge_project = "has_vimeo_video"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "vimeo"
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "mocha"
  s.add_development_dependency "rake"
  
  s.add_runtime_dependency "supermodel"
  
end
