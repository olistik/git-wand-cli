# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_wand/cli/version'

Gem::Specification.new do |spec|
  spec.name          = "git_wand-cli"
  spec.version       = GitWand::CLI::VERSION
  spec.authors       = ["Maurizio De Magnis"]
  spec.email         = ["root@olisti.co"]

  spec.summary       = %q{Command line interface for GitWand, a Ruby client for the GitHub API.}
  spec.homepage      = "https://github.com/olistik/git_wand_cli"
  spec.license       = "AGPL-3"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "git_wand", "~> 0.2"
end
