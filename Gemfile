source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '5.2.0'


gem 'bootstrap-sass'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'bcrypt'
gem 'will_paginate'
gem 'bootstrap-will_paginate'


group :development, :test do
 gem 'sqlite3'
 gem 'byebug', platform: :mri
end

group :development do
 
 gem 'web-console'
 gem 'listen'
 gem 'spring'
 gem 'spring-watcher-listen'
end

group :test do
 # gem 'rails-controller-testing', '0.1.1'
 # gem 'minitest-reporters',       '1.1.9'
 # gem 'guard',                    '2.13.0'
 # gem 'guard-minitest',           '2.4.4'
end





group :production do
  gem 'pg', '~> 1.1'
end




# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
