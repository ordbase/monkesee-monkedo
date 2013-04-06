
class FrontpageController < ApplicationController

  include ApplicationHelper

  def index
    @user =  current_user()  # e.g. User.find( session[:user_id] )
    

  end

end # class FrontpageController