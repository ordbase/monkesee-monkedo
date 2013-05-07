source 'https://rubygems.org'

gem 'rails', '3.2.12'

gem 'sinatra'   # NB: used for logutils (server/service)

gem 'bourbon', '1.4.0' # scss mixins (see http://thoughtbot.com/bourbon)

gem 'logutils', '0.6.0'

gem 'worlddb-data', '99', :git => 'https://github.com/geraldb/world.db.git'
gem 'beerdb-data', '99', :git => 'https://github.com/geraldb/beer.db.git'

gem 'worlddb', '1.6.3'
gem 'beerdb', '0.6.5'

gem 'worlddb-flags', '0.1.0'   # use bundled country flags


group :production do
  gem 'pg'
  gem 'thin'    # use faster multiplexed (w/ eventmachine) web server
end

group :development do
  gem 'sqlite3'
  gem 'annotate', '~> 2.4.1.beta'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'