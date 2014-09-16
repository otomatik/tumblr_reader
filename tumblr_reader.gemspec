# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tumblr_reader/version'

Gem::Specification.new do |spec|
	spec.name          = "tumblr_reader"
	spec.version       = TumblrReader::VERSION
	spec.authors       = ["Thomas Dalous"]
	spec.email         = ["thomas.dalous@gmail.fr"]
	spec.summary       = %q{A Tumblr XML API wrapper.}
	spec.description   = %q{Read posts from any Tumblr easily thanks to the xml API.}
	spec.homepage      = ""
	spec.license       = "MIT"

	spec.files         = `git ls-files -z`.split("\x0")
	spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
	spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
	spec.require_paths = ["lib"]

	spec.add_development_dependency "bundler", "~> 1.7"
	spec.add_development_dependency "rake", "~> 10.0"
	spec.add_development_dependency "rspec"
	spec.add_development_dependency "rspec-nc"
	spec.add_development_dependency "guard"
	spec.add_development_dependency "guard-rspec"
end
