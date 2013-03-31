Prost::Application.routes.draw do

  get "pages/index"

  get "pages/about"

  ## mount sinatra app (bundled w/ logutils gem)
  mount LogDb::Server, :at => '/logs'    # NB: make sure to require 'logutils/server'

  resources :beers
  resources :breweries
  resources :countries
  resources :regions
  resources :tags

  root :to => 'beers#index'
end