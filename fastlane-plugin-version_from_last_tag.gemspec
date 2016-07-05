# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/version_from_last_tag/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-version_from_last_tag'
  spec.version       = Fastlane::VersionFromLastTag::VERSION
  spec.author        = %q{Jeff Stein}
  spec.email         = %q{jeffstein@gmail.com}

  spec.summary       = %q{Perform a regex on last (latest) git tag and perform a regex to extract a version number such as Release 1.2.3}
  # spec.homepage      = "https://github.com/jeeftor/fastlane-plugin-version_from_last_tag"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.97.2'
end
