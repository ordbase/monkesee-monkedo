
BeerDbAdmin::Engine.routes.draw do

  match 'signin', :to => 'sessions#new'
  match 'signout', :to => 'sessions#destroy'
  
  match 'about', :to => 'pages#about'
  
  resource :session, :only => [:new, :create, :destroy]
  
  match 'time',   :to => 'time#index'

  ###############################
  # routes for shortcuts (friendly urls)
  

  ## check - use only get instead of match - will it work??
  match '/b/:key',    :to => 'beers#shortcut'  # convenience alias for /beer/:key
  match '/beer/:key', :to => 'beers#shortcut', :as => :short_beer_worker
  # todo/check: use brewery instead of by shortcut ??
  match '/by/:key',   :to => 'breweries#shortcut', :as => :short_brewery_worker

  # note: 2-3 lower case letters - assume shortcut for country  e.g. /at or /mx or /nir or /sco
  
  match '/c/:key',    :to => 'cities#shortcut',   :key => /[a-z0-9]+/
  match '/city/:key', :to => 'cities#shortcut',  :as => :short_city_worker,   :key => /[a-z0-9]+/

  match '/:key', :to => 'regions#shortcut',   :as => :short_region_worker,  :key => /[a-z]{2,3}[\-+.][a-z]{1,3}/
  match '/:key', :to => 'countries#shortcut', :as => :short_country_worker, :key => /[a-z]{2,3}/
  

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
  resources :cities
  resources :tags

  root :to => 'countries#index'
end
