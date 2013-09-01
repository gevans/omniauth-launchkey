# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-launchkey/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-launchkey'
  spec.version       = Omniauth::Launchkey::VERSION
  spec.authors       = ['Gabe Evans']
  spec.email         = ['gabe@ga.be']
  spec.description   = %q{OmniAuth strategy for LaunchKey}
  spec.summary       = %q{OmniAuth strategy for LaunchKey}
  spec.homepage      = 'https://github.com/launchkey/omniauth-launchkey'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  spec.add_dependency 'multi_json', '~> 1.3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
end
