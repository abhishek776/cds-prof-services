class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :user_id
      t.string :event_id

      t.timestamps null: false
    end
  end
end
