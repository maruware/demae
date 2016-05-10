# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'demae/version'

Gem::Specification.new do |spec|
  spec.name          = "demae"
  spec.version       = Demae::VERSION
  spec.authors       = ["maruware"]
  spec.email         = ["me@maruware.com"]

  spec.summary       = %q{Node manager for itamae}
  spec.description   = %q{Node manager for itamae}
  spec.homepage      = "https://github.com/maruware/demae"

  # spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.files         = `git ls-files`.split($/)
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.bindir   = 'bin'
  spec.executables   = ['demae']
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
