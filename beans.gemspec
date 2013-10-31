$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "beans/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "beans"
  s.version     = Beans::VERSION
  s.authors     = ["Ricky Reusser"]
  s.email       = ["ricky@happyfuncorp.com"]
  s.homepage    = "http://happyfuncorp.com"
  s.summary     = "What is your time actually worth"
  s.description = "Converts time to money."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile"]
  s.test_files = Dir["test/**/*"]

  s.executables << 'beans'
  s.executables << 'beans-server'
  s.executables << 'beansd'

  s.add_dependency "daemons"
  s.add_dependency 'ruby-growl'
end
