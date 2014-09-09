# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise/inactivatable/version'

Gem::Specification.new do |spec|
  spec.name          = "devise_inactivatable"
  spec.version       = DeviseInactivatable::VERSION
  spec.authors       = ["Jonathan C. Calixto"]
  spec.email         = ["jonathanccalixto@gmail.com"]
  spec.summary       = %q{Activate and inactivate a devise account }
  spec.description   = %q{This is a simple, however wonderful devise extension to activate and inactivate users account.}
  spec.homepage      = "https://github.com/jonathanccalixto/devise_inactivatable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "devise", ">= 2.0"
end
