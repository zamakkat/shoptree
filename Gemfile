source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '4.2.6'

gem 'puma'
gem 'pg', '~> 0.15'

# Front-end
gem 'slim-rails'
gem 'bootstrap-sass'
gem 'sass-rails'
gem 'font-awesome-sass'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'rails_utils'
gem 'simple_form'
gem 'select2-rails'

# App specific
gem 'money-rails'
gem 'closure_tree'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'factory_girl_rails'
gem 'faker'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'foreman'
  gem 'quiet_assets'

  # Guards
  gem 'guard-rspec', require: false
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'terminal-notifier-guard'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
