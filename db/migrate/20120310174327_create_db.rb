class CreateDb < ActiveRecord::Migration
  def up
  
create_table :users do |t|
  t.string :name, :null => false
  t.string :email
  t.string :password
  t.timestamps
end
  
  end

  def down
    raise IrreversibleMigration
  end
end