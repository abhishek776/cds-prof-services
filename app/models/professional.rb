class Professional < ActiveRecord::Base
  
  #attr_accessible :name, :motto, :description

  belongs_to :business
  #has_many :dog_mix_linkers
  #has_many :dog_like_linkers
  #has_many :dog_personality_linkers
  #has_many :mixes, :through => :dog_mix_linkers
  #has_many :likes, :through => :dog_like_linkers
  #has_many :personalities, :through => :dog_personality_linkers
  #belongs_to :energy_level
  #belongs_to :size
  
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
  #has_many :pictures, :dependent => :destroy

end
