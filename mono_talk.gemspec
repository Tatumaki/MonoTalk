# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mono_talk/version'

Gem::Specification.new do |spec|
  spec.name          = "mono_talk"
  spec.version       = MonoTalk::VERSION
  spec.authors       = ["Tatumaki"]
  spec.email         = ["Tatumaki.x.euphoric@gmail.com"]
  spec.summary       = %q{Mono talk the simplest TCP conversation tool.}
  spec.description   = %q{Nothing complicated, nothing disturb.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
