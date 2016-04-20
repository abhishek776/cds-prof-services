class AddUserIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :confirmed_user_id, :string
  end
end
