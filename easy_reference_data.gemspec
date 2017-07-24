# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy/reference_data/version'

Gem::Specification.new do |gem|
  gem.name          = "easy_reference_data"
  gem.version       = Easy::ReferenceData::VERSION
  gem.authors       = ["Nigel Ramsay"]
  gem.email         = ["nigel.ramsay@abletech.co.nz"]
  gem.description   = %q{Used to create a predefined set of model instances}
  gem.summary       = %q{Loads files from db/reference/*.rb}
  gem.homepage      = "http://github.com/AbleTech/easy_reference_data"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'rails', '>= 3.0.0'

  gem.add_development_dependency 'rspec', '~> 3.6.0'
  gem.add_development_dependency 'sqlite3', '~> 1.3'
  gem.add_development_dependency 'database_cleaner', '~> 1.6'
end
