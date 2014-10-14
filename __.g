# version = File.read(File.expand_path('../../RAILS_VERSION', __FILE__)).strip
Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'ricer-core'
  s.version = '2.0.1'
  s.summary = 'Ricerbot core files without plugins.'
  s.description = 'Ricerbot is a completely plugin driven chatbot, connecting to various networks, eg: IRC, ICQ, Jabber, Websockets and Netcat.'
  s.required_ruby_version = '>= 2.0.1'
  s.license = 'properitary'
  s.author = 'gizmore'
  s.email = 'gizmore@wechall.net'
  s.homepage = 'https://www.wechall.nets'
#  s.files = Dir['CHANGELOG.md', 'MIT-LICENSE', 'README.rdoc', 'examples/**/*', 'lib/**/*']
  s.files = Dir['README.md', 'gen/**/*', 'lib/**/*']
  s.require_path = 'lib'
#  s.extra_rdoc_files = %w(README.rdoc)
#  s.rdoc_options.concat ['--main', 'README.rdoc']
  s.add_dependency 'i18n', '~> 0'
  s.add_dependency 'bcrypt', '~> 3.1' # 
  s.add_dependency 'activerecord', '~> 4' # 
#  s.add_dependency 'os', '~> 0'
  s.add_dependency 'strip_attributes', '~> 1'
  s.add_dependency 'validate_as_email', '~> 2' #, github: 'gizmore/validate_as_email'
  s.add_dependency 'open4', '~> 1'
  s.add_dependency 'foreigner', '~> 1'
  
end
