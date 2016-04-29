class Photo < ActiveRecord::Base
    
  belongs_to :dog
    
  has_attached_file :image,
                    styles: {:large =>"500x500>",
                            :medium => "300x300>",
                            thumb: ["64x64#", :jpg] },
                    #default_url: "default_dog.jpg",

                    storage: :s3,
                    s3_credentials: "keys.yml", 
                    bucket: "cds-prof",
                    s3_region: "us-east-1"

  validates_attachment :image, 
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] },
      :size => { :in => 0..5000.kilobytes } 
      
end
