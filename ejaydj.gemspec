# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ejaydj/version'

Gem::Specification.new do |spec|
  spec.name          = "ejaydj"
  spec.version       = Ejaydj::VERSION
  spec.authors       = ["Ejay Canaria"]
  spec.email         = ["ejaypcanaria@gmail.com"]
  spec.summary       = %q{A DJ gem that generates songs and playlists based on your spotify account}
  spec.description   = %q{A DJ gem that generates songs and playlists based on your spotify account}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rest-client", "~> 1.7"
  spec.add_runtime_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
