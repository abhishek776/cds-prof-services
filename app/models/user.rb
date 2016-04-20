class User < ActiveRecord::Base
  has_many :dogs, :dependent => :destroy
  has_many :events, :through => :dogs
  
  has_many :bookings, :dependent => :destroy
  has_many :booking_events, through: :bookings, :source => :event
  
  has_many :stars, :dependent => :destroy
  has_many :starred_dogs, through: :stars, :source => :dog

  def update_credentials(credentials)
    self.oauth_token = credentials[:token]
    self.oauth_expires_at = Time.at(credentials[:expires_at].to_i)
    self.save 
  end

  def facebook_info_update(auth)
    self.uid = auth[:uid]
    self.first_name = auth[:info][:name].split(' ')[0]
    self.last_name = auth[:info][:name].split(' ')[1]
    self.email = auth[:info][:email]
    self.image = auth[:info][:image][0..-7] + "large&width=400&height=400"
    if(auth[:extra][:raw_info] != nil)
      self.gender = auth[:extra][:raw_info][:gender]
    end
    self.save
  end
  
  def future_events?
    # for all events, if at least one comes after yesterday, return true
    events.where("end_date > ?", 1.day.ago.midnight).pluck('end_date') != []
  end
end
