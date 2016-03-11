class User < ActiveRecord::Base
  
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
    self.image = auth[:info][:image][0..-7] + "normal"
    if(auth[:extra][:raw_info] != nil)
      self.gender = auth[:extra][:raw_info][:gender]
    end
    self.save
  end
    
end
