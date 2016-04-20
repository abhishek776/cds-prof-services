class CreateBookedEvents < ActiveRecord::Migration
  def change
    create_table :booked_events do |t|
      t.string :event_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end

