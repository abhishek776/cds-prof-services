class AddYouTubeIdToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :youtube_id, :string
  end
end
