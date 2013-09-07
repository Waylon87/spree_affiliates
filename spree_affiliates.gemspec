# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_affiliates'
  s.version     = '2.0.3'
  s.summary     = 'Spree Affiliate Extension'
  s.description = 'Enable Spree users to become affiliates.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = ['Jeff Dutil', 'Jeff Squires']
  s.email     = ['jdutil@burlingtonwebapps.com', 'jsquires@railsdog.com']
  s.homepage  = 'http://www.spreecommerce.com'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.0.3'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'coveralls'
  # https://github.com/bmabey/database_cleaner/issues/224
  # it thought we were using postgres when using sqlite3 in specs
  s.add_development_dependency 'database_cleaner', '1.0.1' 
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'sqlite3'
end
