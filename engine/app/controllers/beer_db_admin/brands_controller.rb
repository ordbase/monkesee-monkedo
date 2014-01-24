
class BrandsController < ApplicationController
  
  def index
    @brands = Brand.all
  end
  
=begin  
  # GET /brands/:id e.g. /brands/1
  def show
    @brand = Brand.find( params[:id] )
  end
=end

end # class BrandsController
