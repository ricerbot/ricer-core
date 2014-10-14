# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ricer/version'

Gem::Specification.new do |spec|
  spec.name          = "ricer-core"
  spec.version       = Ricer::VERSION
  spec.authors       = ["gizmore"]
  spec.email         = ["gizmore@wechall.net"]
  spec.homepage      = 'https://www.wechall.net/profile/ricer'
  spec.license       = "properitary"
  spec.summary       = 'Ricerbot core files without plugins.'
  spec.description   = 'Ricerbot is a plugin driven chatbot, connecting to various networks, eg: IRC, ICQ, Jabber, Websockets and Netcat.'
#  s.required_ruby_version = '>= 2.0.1'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_runtime_dependency "rake", "~> 10.0"
  
  spec.add_runtime_dependency 'i18n', '~> 0'
  spec.add_runtime_dependency 'bcrypt', '~> 3.1' # 
  spec.add_runtime_dependency 'activerecord', '~> 4' # 
# spec.add_runtime_dependency 'os', '~> 0'
  spec.add_runtime_dependency 'strip_attributes', '~> 1'
  spec.add_runtime_dependency 'validate_as_email', '~> 2' #, github: 'gizmore/validate_as_email'
  spec.add_runtime_dependency 'open4', '~> 1'
  spec.add_runtime_dependency 'foreigner', '~> 1'
end
