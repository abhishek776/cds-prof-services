class Personality < ActiveRecord::Base
  # attr_accessible :value
  has_many :dog_personality_linkers
  has_many :dogs, :through => :dog_personality_linkers

end
