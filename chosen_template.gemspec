# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chosen_template/version'

Gem::Specification.new do |spec|
  spec.name          = "chosen_template"
  spec.version       = ChosenTemplate::VERSION
  spec.authors       = ["Ramon Tayag"]
  spec.email         = ["ramon.tayag@gmail.com"]
  spec.description   = %q{Manage the preview and publish tasks of templates}
  spec.summary       = %q{Manage the preview and publish tasks of templates. See the readme for a scenario as I don't know how else to describe it!}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.13.0"
  spec.add_development_dependency "rspec-rails", ">= 2.13.0"
  spec.add_development_dependency "factory_girl", "~> 4.2.0"
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'timecop'
  spec.add_development_dependency 'database_cleaner'
  spec.add_dependency "rails", ">= 3.0.0"
end
