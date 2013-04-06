
class Drink < ActiveRecord::Base

  belongs_to :beer, class_name: 'BeerDb::Models::Beer'
  belongs_to :user

end # class Drink
