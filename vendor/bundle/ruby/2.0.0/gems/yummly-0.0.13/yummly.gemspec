# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yummly/version'

Gem::Specification.new do |gem|
  gem.name          = "yummly"
  gem.version       = Yummly::VERSION
  gem.authors       = ["Theo Mills"]
  gem.license       = 'MIT'
  gem.email         = ["twmills@twmills.com"]
  gem.description   = %q{Ruby wrapper to the Yummly API}
  gem.summary       = "This is the unofficial ruby wrapper to the Yummly API, \"the world's largest and most powerful recipe search site\""
  gem.homepage      = "https://github.com/twmills/yummly"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('faraday', '>= 0.8.7')
  gem.add_dependency('rack', ">= 1.4.5")
  gem.add_dependency('json', "~> 1.8.0")
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
end
