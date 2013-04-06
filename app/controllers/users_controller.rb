
class UsersController < ApplicationController
  
  include ApplicationHelper  # fix: move to ApplcationController current_user etc.
  
  def index
  end

  def show
  end
  
  ## change to mark_beer/bookmark_beer or new_user_bookmark/new_user_beermark ??
  def add_beer
    beer = Beer.find( params[:beer_id])
    # assert that params[:id] == current_user_id
    user = current_user()
    
    # check if bookmark exists; if not create it
    bookmark = Bookmark.find_by_bookmarkable_id_and_user_id( beer.id, user.id )
    if bookmark.nil?
      bookmark = Bookmark.new
      bookmark.user_id = user.id
      bookmark.bookmarkable_id   = beer.id
      bookmark.bookmarkable_type = 'BeerDb::Models::Beer'
    end

    flash[:notice] = 'Bookmark erfolgreich gespeichert.'
    bookmark.save!

    redirect_to :back
  end
  
  def add_brewery
    ## add all beer from a brewery
  end

end # class UsersController
