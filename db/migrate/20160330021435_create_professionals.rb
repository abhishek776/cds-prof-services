class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :image
      t.string :description
      t.string :motto
      t.integer :business_id
    end
  
    create_table :businesses do |t|
      t.string :name
      t.string :location
      t.string :image
      t.string :short_description
      t.string :description
      t.string :motto
      t.integer :business_id
    end
  
  end
end