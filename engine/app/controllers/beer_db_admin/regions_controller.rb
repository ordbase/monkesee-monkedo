# encoding: utf-8

module BeerDbAdmin

class RegionsController < BeerDbAdminController
  
  def index
    @regions = Region.all
  end

end # class RegionsController

end # module BeerDbAdmin
