class ChangeDogs < ActiveRecord::Migration
  def change
    change_table :dogs do |t|
      t.remove :image
      t.string :image
    end
  end
end
