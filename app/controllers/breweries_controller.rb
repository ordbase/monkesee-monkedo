
class BreweriesController < ApplicationController
  
  def index
    @breweries = Brewery.all
  end

end # class BreweriesController
