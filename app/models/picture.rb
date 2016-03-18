class Picture < ActiveRecord::Base

  belongs_to :dog
  # attr_accessible :image

  has_attached_file :image,
    :styles => {
      :large =>"500x500>",
      :medium => "300x300>",
      :thumb => "100x100>" },
    :url => "/:class/:attachment/:id/:style_:basename.:extension"
  
  validates_attachment :image, 
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] },
      :size => { :in => 0..20.kilobytes } 

  # paperclip multiple pictures
  # has_attached_file :image,
  #                   :styles => { :small    => '150x',
  #                               :medium   => '300x' },
  #                   :default_url => "",
  #                   # :storage => :s3,
  #                   :bucket => 'cds-prof-services',
  #                   :path => "/:class/:pictures/:id/:style/:basename.:extension"
                    

  # validates_attachment_presence :image, :message => "Photo can't be blank"
  # validates_attachment_size :image, :less_than => 5.megabytes
  # validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

end
