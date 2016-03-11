class DogsCreate < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :image
      t.datetime :dob
      t.string :description
      t.string :motto
      t.boolean :fixed
      t.string :health
      t.string :availability
      t.string :gender
      t.integer :size_id
      t.integer :energy_level_id
      t.integer :user_id
    end
  end
end
