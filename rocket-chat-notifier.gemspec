# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rocketchat/notifier/version'

Gem::Specification.new do |spec|
  spec.name          = "rocketchat-notifier"
  spec.version       = RocketChat::Notifier::VERSION
  spec.authors       = ["Christoph Bajohr"]
  spec.email         = ["christoph@bajohr.org"]

  spec.summary       = "rocket.chat notifier gem"
  spec.description   = "rocket.chat notifier gem, for firing event notifications to a rocket chat incoming webhook. For further information visit the github page: https://github.com/cbajohr/rocketchat-notifier"
  spec.homepage      = "https://github.com/cbajohr/rocketchat-notifier"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_dependency "httparty", "~> 0.13.7", ">= 0.13.7"
end

