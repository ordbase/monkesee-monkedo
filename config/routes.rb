Prost::Application.routes.draw do

  match 'signin', :to => 'sessions#new'
  match 'signout', :to => 'sessions#destroy'
  
  match 'about', :to => 'pages#about'

  resource :session, :only => [:new, :create, :destroy]


  #############
  ## routes for admin

  match 'admin', :to => 'admin/users#index'
  
  namespace :admin do
    resources :users
  end


  ## mount sinatra app (bundled w/ logutils gem)
  mount LogDb::Server, :at => '/logs'    # NB: make sure to require 'logutils/server'

  resources :beers
  resources :breweries
  resources :countries
  resources :regions
  resources :tags

  root :to => 'beers#index'
end