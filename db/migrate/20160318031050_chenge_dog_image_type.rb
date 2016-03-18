class ChengeDogImageType < ActiveRecord::Migration
  def change
    change_table :dogs do |t|
      t.remove :image
      t.binary :image
    end
  end
end
