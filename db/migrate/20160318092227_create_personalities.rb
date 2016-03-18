class CreatePersonalities < ActiveRecord::Migration
  def change
    create_table :dog_personality_linkers do |t|
      t.integer "dog_id"
      t.integer "personality_id"
    end
  end
end
