class DropAllDogHelpers < ActiveRecord::Migration
  def change
    drop_table :mixes
    drop_table :likes
    drop_table :personalities
    drop_table :energy_levels
    drop_table :sizes
    drop_table :dog_like_linkers
    drop_table :dog_mix_linkers
  end
end
