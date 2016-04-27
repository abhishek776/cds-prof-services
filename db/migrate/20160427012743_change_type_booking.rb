class ChangeTypeBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :user_id, :string
    remove_column :bookings, :event_id, :string
    change_table(:bookings) do |t|
      t.references :user
      t.references :event
    end
    add_index :bookings, :user_id
    add_index :bookings, :event_id
  end
end
