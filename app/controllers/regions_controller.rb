
class RegionsController < ApplicationController
  
  def index
    @regions = Region.all
  end

end # class RegionsController
