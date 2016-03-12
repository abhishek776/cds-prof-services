class HomeController < ApplicationController
  
  def feed
    @user = User.find(session[:user_id])
    render 'feed'
  end
end
