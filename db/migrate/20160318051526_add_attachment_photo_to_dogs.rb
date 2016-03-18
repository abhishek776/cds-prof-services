class AddAttachmentPhotoToDogs < ActiveRecord::Migration
  def self.up
    change_table :dogs do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :dogs, :photo
  end
end
