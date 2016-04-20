class Event < ActiveRecord::Base
  belongs_to :dog
  has_many :bookings, :dependent => :destroy
  has_many :booking_users, through: :bookings, :source => :user
  
  validates :start_date, :presence => {:message => "Please enter a valid start date"}
  validates :end_date, :presence => {:message => "Please enter a valid end date"}
  validates :time_of_day, :presence => {:message => "Please enter a time of day"}
  validates :dog, :presence => {:message => "Please select the dog you want to share"}

  serialize :time_of_day
end
