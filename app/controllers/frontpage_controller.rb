
class FrontpageController < ApplicationController

  include ApplicationHelper

  def index
    redirect_to user_path( current_user_id() )
  end

end # class FrontpageController