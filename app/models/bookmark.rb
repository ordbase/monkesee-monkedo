
## todo:
#  rename to Beermark ? why? why?? not?
# Bookmark / Beer-style, thus, Beermark

class Bookmark < ActiveRecord::Base

  ### fix: remove (after next migration!!!)
  self.table_name = 'cellars'

  belongs_to :beer, :class_name => 'BeerDb::Models::Beer'
  belongs_to :user
  

  ### fix - how to do it with has_many macro? use finder_sql?
  def drinks
    Drink.where( user_id: user_id, beer_id: beer_id )
  end

end # class Bookmark
