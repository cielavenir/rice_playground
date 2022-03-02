# coding: utf-8
#require './rice_playground'

Gem::Specification.new do |spec|
  spec.name          = "rice_playground"
  spec.version       = '0.0.0.1'
  spec.authors       = ["cielavenir"]
  spec.email         = ["cielartisan@gmail.com"]
  spec.description   = "rice_playground"
  spec.summary       = "rice_playground"
  spec.homepage      = "http://github.com/cielavenir/rice_playground"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/) + [
    "LICENSE",
    "README.md",
    #"CHANGELOG.md",
  ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.extensions    = ["extconf.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rice"
end
