
BeerDbAdmin::Engine.routes.draw do

  match 'signin', :to => 'sessions#new'
  match 'signout', :to => 'sessions#destroy'
  
  match 'about', :to => 'pages#about'
  
  resource :session, :only => [:new, :create, :destroy]
  
  match 'time',   :to => 'time#index'

  ###############################
  # routes for shortcuts (friendly urls)
  
  ## 2 lower case letters - assume shortcut for country
  match '/:key', :to => 'countries#shortcut', :as => :short_country_worker, :key => /[a-z]{2}/


  # current user's start page/front page
  match 'frontpage', :to => 'frontpage#index'

  match 'beers/:beer_id/users/:id',        :to => 'users#add_beer',    :as => 'add_beer_to_user'
  match 'breweries/:brewery_id/users/:id', :to => 'users#add_brewery', :as => 'add_brewery_to_user'
  match 'users/:user_id/beers/:beer_id/drinks/new', :to => 'drinks#new', :as => 'new_user_beer_drink'

  match 'bookmarks/:id/flag', :to => 'bookmarks#update_flag', :as => 'update_bookmark_flag'

  resources :drinks
  resources :bookmarks 
  

  resources :users do
   ## resources :drinks
   ## resources :bookmarks
  end

  resources :beers
  resources :brands
  resources :breweries
  resources :countries
  resources :regions
  resources :tags

  root :to => 'beers#index'
end