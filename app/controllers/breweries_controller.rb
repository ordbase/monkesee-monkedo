
class BreweriesController < ApplicationController
  
  def index
    order = params[:order] || 'title'

    if order == 'key'
      order_clause = 'key'
    elsif order == 'hl'
      order_clause = 'prod desc, title'
    else   # by_title
      order_clause = 'title'
    end
    
    @breweries = Brewery.order( order_clause )
  end

end # class BreweriesController
