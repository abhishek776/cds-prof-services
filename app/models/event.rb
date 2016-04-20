class Event < ActiveRecord::Base
  # attr_accessible :start_date, :end_date, :time_of_day, :my_location, :dog, :description
  belongs_to :dog
  has_many :bookings, :dependent => :destroy


  validates :start_date, :presence => {:message => "Please enter a valid start date"}
  validates :end_date, :presence => {:message => "Please enter a valid end date"}
  validates :time_of_day, :presence => {:message => "Please enter a time of day"}
  validates :dog, :presence => {:message => "Please select the dog you want to share"}

  serialize :time_of_day

end
