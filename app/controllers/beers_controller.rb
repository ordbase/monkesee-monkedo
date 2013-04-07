
class BeersController < ApplicationController
  
  def index
    @beers = Beer.all
  end
  
  # GET /beers/:id e.g. /beers/1
  def show
    @beer = Beer.find( params[:id] )
  end

end # class BeersController
