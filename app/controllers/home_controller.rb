class HomeController < ApplicationController
  
  def feed
    if current_user == nil
      redirect_to root_path
    else
      @user = current_user
      render 'feed'
    end
  end
  
end
