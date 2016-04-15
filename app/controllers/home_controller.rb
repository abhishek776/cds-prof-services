class HomeController < ApplicationController
  
  def feed
    if current_user == nil
      redirect_to root_path
    else
      @user = current_user
      @stars = Star.where(user_id: @current_user.id)
      @staredDogs = []
      @stars.each do |s| 
        @staredDogs.push(Dog.find(s.dog_id))  
      end
      render 'feed'
    end
  end
  
end
