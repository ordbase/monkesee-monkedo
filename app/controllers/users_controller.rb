
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


    # move check params to bookmarks controller
    # - use regular update for example
    
    # check params
    if params[:yes].present?
      if params[:yes] == 'true' || params[:yes] == 't'
        bookmark.yes = true  # +1
        bookmark.no  = false
      else
        bookmark.yes = false
      end
    end
      
    if params[:no].present?
      if params[:no] == 'true' || params[:no] == 't'
        bookmark.no  = true  # -1
        bookmark.yes = false
      else  
        bookmark.no = false
      end
    end

    if params[:wish].present?
      if params[:wish] == 'true' || params[:wish] == 't'
        bookmark.wish = true
        bookmark.no    = false  # reset -1 flag if present
      else
        bookmark.wish = false
      end
    end

    flash[:notice] = 'Bookmark erfolgreich gespeichert.'
    bookmark.save!

    redirect_to :back
  end
  
  def add_brewery
    ## add all beer from a brewery
  end

end # class UsersController
