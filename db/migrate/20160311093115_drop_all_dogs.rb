class DropAllDogs < ActiveRecord::Migration
  def up
    drop_table :mixes
  end
  
  def up
    drop_table :likes
  end
  
  def up
    drop_table :personalities
  end

  def up
    drop_table :energy_levels
  end
  
  def up
    drop_table :sizes
  end
        
  def up
    drop_table :dog_like_linkers
  end  
   
  def up
    drop_table :dog_mix_linkers
  end
  
  def up
    drop_table :dog_personality_linkers
  end
  
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
