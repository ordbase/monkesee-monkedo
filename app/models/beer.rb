

module BeerDb::Models

class Beer
  
  has_many :drinks   ## :class_name => 'Drink'
  has_many :bookmarks, :as => :bookmarkable

end # class Beer

end # module BeerDb::Models

Beer = BeerDb::Models::Beer
