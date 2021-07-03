# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zadarma_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'zadarma-api-ruby'
  spec.version       = ZadarmaApi::VERSION
  spec.summary       = 'zadarma.com api ruby client'
  spec.authors       = ['Aleksandr Polyakov']
  spec.email         = 'backstabe@gmail.com'
  spec.files         = Dir['{lib,spec}/**/*', 'LICENSE', 'README.md']
  spec.require_paths = ['lib']
  spec.homepage      = 'https://github.com/KaifasKain/zadarma-api-ruby'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.5.0'

  spec.add_dependency 'faraday', '~> 1.4'
  spec.add_dependency 'faraday_middleware'
end
