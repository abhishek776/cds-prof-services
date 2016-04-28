class Dog < ActiveRecord::Base

  scope :has_gender, lambda {|genders| filter_gender(genders)}
  scope :has_likes, lambda {|likes| filter_like(likes)}
  scope :has_mix, lambda {|mix| filter_mix(mix)}
  scope :has_energy_level, lambda {|energy_levels| filter_energy_level(energy_levels)}
  scope :has_size, lambda {|sizes| filter_size(sizes)}
  scope :in_age_range, lambda {|age_query| filter_age(age_query)}

  belongs_to :user
  has_many :dog_mix_linkers
  has_many :dog_like_linkers
  has_many :dog_personality_linkers
  has_many :mixes, :through => :dog_mix_linkers
  has_many :likes, :through => :dog_like_linkers
  has_many :personalities, :through => :dog_personality_linkers
  belongs_to :energy_level
  belongs_to :size
  
  has_many :events, :dependent => :destroy
  has_many :stars, :dependent => :destroy
  
  YT_LINK_FORMAT = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  
  has_attached_file :image,
    :styles => {:large =>"500x500>",:medium => "300x300>",:thumb => "100x100>"},
    :default_url => "default_dog.jpg",
    :url => "/:class/:attachment/:id/:style_:basename.:extension"
    
  
  validates_attachment :image, 
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] },
      :size => { :in => 0..500.kilobytes } 

  def set_mix_like_personality(new_mixes, new_likes, new_pers)
    self.mixes = []
    self.likes = []
    self.personalities = []
    new_mixes.each { |s| self.mixes << Mix.find_by_value(s)} unless new_mixes.nil?
    new_likes.each { |s| self.likes << Like.find_by_value(s)} unless new_likes.nil?
    new_pers.each { |s| self.personalities << Personality.find_by_value(s)} unless new_pers.nil?
  end
  
  def age_caption
    # now = Time.now.utc.to_date
    now = Time.now.to_datetime
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
  
   # Event Methods
  def future_events?
    # for all events, if at least one comes after yesterday, return true
    events.where("end_date > ?", 1.day.ago.midnight).pluck('end_date') != []
  end

  def future_events
    events.where("end_date > ?", 1.day.ago.midnight).order("start_date ASC")
  end
  
  def tags
    readable_personalities.join(", ") 
  end

  def self.age_ranges
    ["0-2 years", "2-4 years", "5-8 years", "9+ years"]
  end

  def self.filter_gender(genders)
    where("gender" => genders) unless genders.empty?
  end

  def self.filter_mix(mix)
    joins(:mixes).where("mixes.value" => mix) unless mix.empty?
  end

  def self.filter_energy_level(energy_levels)
    joins(:energy_level).where("energy_levels.value" => energy_levels) unless energy_levels.empty?
  end

  def self.filter_size(sizes)
    joins(:size).where("sizes.value" => sizes) unless sizes.empty?
  end
  
  def self.filter_age(age_query)
    where(age_query) unless age_query == ""
  end

  def self.convert_age_ranges_to_dob_query(age_ranges_indices)
    age_range_nums = [[0, 2], [2, 4], [5, 8], [9, 30]]
    query_arr = []
    age_ranges_indices.each do |age_range|
        query_arr << get_base(age_ranges.index(age_range), age_range_nums)
    end
    query_arr.join(' OR ')
  end

  def self.get_base(i, ranges)
    first = (Time.now.to_datetime - ranges[i][1].years).strftime "%Y-%m-%d %H:%M:%S"
    second = (Time.now.to_datetime - ranges[i][0].years).strftime "%Y-%m-%d %H:%M:%S"
    base = %Q[("dogs"."dob" BETWEEN '#{first}' AND '#{second}')]
  end

  def self.filter_by(criteria)
    dogs = Dog.all.has_mix(criteria[:mix])
              .has_size(criteria[:size])
              .has_gender(criteria[:gender])
              .has_energy_level(criteria[:energy_level])
              .in_age_range(convert_age_ranges_to_dob_query(criteria[:age])).uniq
  end

 
end
