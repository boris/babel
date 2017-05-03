source 'https://rubygems.org'

gem 'rails', '4.2.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'
gem 'mysql2', '~> 0.3.20'
gem 'i18n', github: 'svenfuchs/i18n'
gem 'country_select', github: 'stefanpenner/country_select'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  #gem 'capistrano-rails', '~> 1.1.1'
  #gem 'capistrano-bundler'
  #gem 'capistrano-rbenv'
end

group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end

ruby "2.3.1"
