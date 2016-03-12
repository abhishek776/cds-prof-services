class DropDogs < ActiveRecord::Migration
  def up
    drop_table :dogs
  end
end
