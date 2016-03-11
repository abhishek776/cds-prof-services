class AddFieldsToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :image, :string
    add_column :users, :phone_number, :string
    add_column :users, :description, :string
    add_column :users, :address, :string
    add_column :users, :zipcode, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
  end
end