
class CreateDb < ActiveRecord::Migration
  def up
    LogDb.create
    WorldDb.create
    BeerDb.create

    create_table :users do |t|
      t.string  :key,    :null => false   # import/export key
      t.string  :name,   :null => false
      t.string  :email,  :null => false
      t.boolean :admin,  :null => false, :default => false
      t.boolean :guest,  :null => false, :default => false
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end

    create_table :drinks do |t| # join table (user,beer)
      t.references :beer, :null => false
      t.references :user, :null => false
      t.integer    :rating    # 1-10 scala (10 is best)
      t.text       :comments
      t.string     :place     # location (place) where tasted/drunken
      
      ## todo: add flag for bottle, can, draft
      
      t.timestamps
    end

    ## todo: change to beermarks instead of bookmarks?
    create_table :bookmarks do |t|   # join table (user,beer)
      t.references :beer, :null => false
      t.references :user, :null => false
      t.boolean :yes,   :null => false, :default => false  # like/favorite/top
      t.boolean :no,    :null => false, :default => false  # dislike/flop/blacklisted
      t.boolean :drunk, :null => false, :default => true   # e.g drunk == false => wishlist (beer not yet drunken/tasted)
      
      t.timestamps
    end

  end # method up

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
