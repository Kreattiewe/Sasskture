# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Sasskture/version'

Gem::Specification.new do |spec|
  spec.name          = "Sasskture"
  spec.version       = Sasskture::VERSION
  spec.authors       = ["Angel Botto"]
  spec.email         = ["angelbotto@gmail.com"]
  spec.summary       = "Generate basic structure for sass projects"
  spec.description   = "Generate basic structure for sass projects"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["sasskture"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
