Prost::Application.routes.draw do

  match 'signin', :to => 'sessions#new'
  match 'signout', :to => 'sessions#destroy'
  
  match 'about', :to => 'pages#about'

  resource :session, :only => [:new, :create, :destroy]

  # current user's start page/front page
  match 'frontpage', :to => 'frontpage#index'

  match 'beers/:beer_id/users/:id',        :to => 'users#add_beer',    :as => 'add_beer_to_user'
  match 'breweries/:brewery_id/users/:id', :to => 'users#add_brewery', :as => 'add_brewery_to_user'
  match 'users/:user_id/beers/:beer_id/drinks/new', :to => 'drinks#new', :as => 'new_user_beer_drink'

  resources :drinks

  resources :users do
   ## resources :drinks
   ## resources :bookmarks
  end

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