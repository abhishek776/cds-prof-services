class User < ActiveRecord::Base
  # attr_accessible :uid, :oauth_token, :oauth_expires_at, :first_name, :last_name, :location, :gender, :image, :status, :phone_number, :email, :availability, :description, :address, :zipcode, :city, :country
  # validates :phone_number, format: { with: /\(\d{3}\)(\ ?)\d{3}-\d{4}/, message: "Bad format for phone number." }, :allow_blank => true
  # validates :zipcode, format: { with: /\d{5}/, message: "Bad format for zipcode."}, :allow_blank => true
  has_many :dogs, :dependent => :destroy
  has_many :events, :through => :dogs
  has_many :booking, :dependent => :destroy

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


  # def full_name
  #   return "#{self.first_name} #{self.last_name}"
  # end
  
  
  def future_events?
    # for all events, if at least one comes after yesterday, return true
    events.where("end_date > ?", 1.day.ago.midnight).pluck('end_date') != []
  end


end
