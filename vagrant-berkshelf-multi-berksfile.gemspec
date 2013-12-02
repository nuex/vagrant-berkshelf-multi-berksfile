# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'multi_berksfile/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-berkshelf-multi-berksfile"
  spec.version       = Vagrant::MultiBerksfile::VERSION
  spec.authors       = ["nuex"]
  spec.email         = ["nx@nu-ex.com"]
  spec.description   = %q{vagrant-berkshelf Berksfile support for multiple vms}
  spec.summary       = %q{This gem will add multiple vm Berksfile support to the vagrant-berkshelf plugin}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'vagrant-berkshelf'
end
