class Dog < ActiveRecord::Base
#   attr_accessible :name
 has_many :pictures, :dependent => :destroy
  has_many :dog_mix_linkers
  has_many :mixes, :through => :dog_mix_linkers
#  has_attached_file :image
                    # :styles => { :small    => '150x',
                    #              :medium   => '300x' },
                    # :default_url => "",
                    # :storage => :s3,
                    # :bucket => 'citydogshare',
                    # :path => "/:class/:images/:id/:style/:basename.:extension"
end
