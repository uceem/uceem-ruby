# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uceem/version'

Gem::Specification.new do |gem|
  gem.authors       = ["John Otander"]
  gem.email         = ["johnotander@uceem.com"]
  gem.description   = %q{A gem to talk seamlessly with Uceem's API.}
  gem.summary       = %q{A gem to talk seamlessly with Uceem's API.}
  gem.homepage      = "https://github.com/uceem"

  gem.version       = Uceem::VERSION
  gem.files         = `git ls-files`.split($\)
  gem.test_files    = Dir['spec/**/*']
  gem.name          = "uceem"
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'json'
  gem.add_dependency 'rest-client'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'vcr'
end
