class Dog < ActiveRecord::Base
  # attr_accessible :name, :image, :dob, :gender, :description, :motto, :fixed, :health, :comments, :contact, :availability, :mixes, :likes, :energy_level, :size, :personalities, :photo, :latitude, :longitude, :video

  belongs_to :user
  has_many :dog_mix_linkers
  has_many :dog_like_linkers
  has_many :dog_personality_linkers
  has_many :mixes, :through => :dog_mix_linkers
  has_many :likes, :through => :dog_like_linkers
  has_many :personalities, :through => :dog_personality_linkers
  belongs_to :energy_level
  belongs_to :size
  
  has_many :pictures, :dependent => :destroy
  
  # has_attached_file :image,
  #   :styles => {
  #     :large =>"500x500>",
  #     :medium => "300x300>",
  #     :thumb => "100x100>" },
  #   :url => "/:class/:attachment/:id/:style_:basename.:extension"
  
  # validates_attachment :image, 
  #     content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] },
  #     :size => { :in => 0..500.kilobytes } 



  #paperclip dog multiple pictures
  has_many :pictures, :dependent => :destroy
  
  def age_caption
    now = Time.now.utc.to_date
    age_in_months = (now.year - dob.year) * 12 + now.month - dob.month
    # 0 month old puppies will be considered 1 month old
    age_in_months = 1 if age_in_months == 0
    if age_in_months >= 12
      age_in_years = (age_in_months / 12).floor
      caption = "#{age_in_years} years"
    else
      caption = "#{age_in_months} months"
    end
    return caption
  end
  
  def energy_level
    EnergyLevel.find(self.energy_level_id).value
  end
  
  def mix_caption
    mix_list = self.mixes.map {|m| m.value}
    mix_list.join(", ")
  end
  
  def self.filter_mix(mix)
    joins(:mixes).where("mixes.value" => mix) unless mix == "All Mixes"
  end
  
  def personality_caption
    personality_list = self.personalities.map {|m| m.value}
    personality_list.join(", ")
  end
  
  def readable_mixes
    self.mixes.map {|m| m.value}
  end
  
  def readable_likes
    self.likes.map {|l| l.value}
  end
  
  def readable_personalities
    self.personalities.map {|p| p.value}
  end
  
  def owner
    User.find(self.user_id)
  end

end
