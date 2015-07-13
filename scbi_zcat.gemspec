# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scbi_zcat/version'

Gem::Specification.new do |spec|
  spec.name          = "scbi_zcat"
  spec.version       = ScbiZcat::VERSION
  spec.authors       = ["dariogf"]
  spec.email         = ["dariogf@gmail.com"]
  spec.summary       = %q{Read files with readline from a zcat pipe of a gz file}
  spec.description   = %q{Read files from a zcat pipe of a gz file. Useful to read multiple gz streams that are stored on the same file}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
