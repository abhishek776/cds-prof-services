class ChangeDogsPhotoAdd < ActiveRecord::Migration
  def change
    change_table :dogs do |t|
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.integer  "photo_file_size"
      t.datetime "photo_updated_at"
    end
  end
end
