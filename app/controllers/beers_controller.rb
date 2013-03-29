
class BeersController < ApplicationController
  
  def index
    @beers = Beer.all
  end

end # class BeersController
