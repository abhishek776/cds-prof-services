class AddIndex < ActiveRecord::Migration
  def change
    add_index :bookings, :user_id
    add_index :bookings, :event_id
  end
end
