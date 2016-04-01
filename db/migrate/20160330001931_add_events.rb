class AddEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
  		t.datetime :start_date
  		t.datetime :end_date
  		t.string :time_of_day
  		t.string :my_location
  		t.integer :dog_id
  		t.string :description
  	end
  end
end
