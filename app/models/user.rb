class User < ActiveRecord::Base
  
  def update_credentials(credentials)
    self.oauth_token = credentials[:token]
    self.oauth_expires_at = Time.at(credentials[:expires_at].to_i)
    self.save 
  end

  def facebook_info_update(auth)
    self.uid = auth[:uid]
    self.name = "#{auth[:info][:first_name]} #{auth[:info][:last_name]}"
    self.email = auth[:info][:email]
    self.save
  end
    
end
