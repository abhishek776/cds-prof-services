class Photo < ActiveRecord::Base
    
  belongs_to :dog
    
  has_attached_file :image,
    styles: {:large =>"500x500>",
                :medium => "300x300>",
                thumb: ["64x64#", :jpg] },
    default_url: "default_dog.jpg",
   # :url => "/:class/:attachment/:id/:style_:basename.:extension"
    storage: :s3,
    s3_credentials: {access_key_id: "AKIAJDJY4V3QGDVGH2WQ", secret_access_key: "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"},
    bucket: "cds-prof",
    region: 'us-east-1'

  validates_attachment :image, 
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] },
      :size => { :in => 0..500.kilobytes } 
      
end
