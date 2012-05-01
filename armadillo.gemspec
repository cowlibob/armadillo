Gem::Specification.new do |s|
  s.name        = 'ruby_armadillo'
  s.version     = '0.0.0'
  s.date        = '2012-04-25'
  s.summary     = "Armadillo key generation"
  s.description = "Wrapper API for working with Digital River's Armadillo software theft protection system"
  s.authors     = ["James Cowlisaw"]
  s.email       = 'james@cowlibob.co.uk'
  s.files       = ["lib/armadillo.rb", "lib/armadillo/codegen.rb", "lib/armadillo/project.rb"]
  s.homepage    = 'http://rubygems.org/gems/ruby_armadillo'

  s.required_ruby_version = '>= 1.9.2'
  s.add_runtime_dependency 'inifile', '~> 1.1', '>= 1.1.0'
  s.add_runtime_dependency 'ffi', '~> 1.0', '>= 1.0.11'
end