class ChangeDogDelPClip < ActiveRecord::Migration
  def change
    change_table :dogs do |t|
      t.remove   "photo_file_name"
      t.remove   "photo_content_type"
      t.remove  "photo_file_size"
      t.remove "photo_updated_at"
    end
    
    change_table :pictures do |t|
      t.remove   "image_file_name"
      t.remove   "image_content_type"
      t.remove  "image_file_size"
      t.remove "image_updated_at"
    end
  end
end
