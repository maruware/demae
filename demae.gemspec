# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'demae/version'

Gem::Specification.new do |spec|
  spec.name          = 'demae'
  spec.version       = Demae::VERSION
  spec.authors       = ['maruware']
  spec.email         = ['me@maruware.com']

  spec.summary       = 'Itamae ssh runner for nodes on environment.'
  spec.description   = 'Itamae ssh runner for nodes on environment.'
  spec.homepage      = 'https://github.com/maruware/demae'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.bindir = 'bin'
  spec.executables   = ['demae']
  spec.require_paths = ['lib']

  spec.add_dependency 'hashie'
  spec.add_dependency 'thor'
  spec.add_dependency 'itamae'
  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
