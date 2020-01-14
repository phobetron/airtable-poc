require_relative File.expand_path('lib/airtable_poc/version', __dir__)

Gem::Specification.new do |gem|
  gem.authors       = ['Charles Hudson']
  gem.email         = ['phobetron@gmail.com']
  gem.name          = 'airtable-poc'
  gem.description   = 'airtable-poc'
  gem.summary       = 'Airtable Proof of Concept'
  gem.homepage      = 'https://github.com/phobetron/airtable-poc'
  gem.license       = 'MIT'

  gem.files         = [
    Dir['exe/*'],
    Dir['lib/**/*']
  ].flatten
  gem.bindir        = 'exe'
  gem.executables   = gem.files.grep(%r{^exe/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.version       = AirtablePoc::VERSION

  gem.add_dependency 'airrecord', '~> 1.0.3'
  gem.add_dependency 'thor', '~> 0.20'

  # Not development dependencies, because the dockerhub build ignores them
  gem.add_dependency 'rspec', '~> 3.8'
  gem.add_dependency 'rubocop', '~> 0.74'
  gem.add_dependency 'simplecov', '~> 0.17'
end
