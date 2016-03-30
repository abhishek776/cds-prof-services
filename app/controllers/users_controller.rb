class UsersController < ApplicationController
  before_filter :current_user
  def show
      @user = User.find(session[:user_id])
      @dogs = Dog.where(user_id: @user.uid)
      # Movie.where(rating: @selected_ratings.keys).order(ordering)
      render 'show'
=begin
    if User.exists?(params[:id]) == false
      flash[:notice] = "The user you entered does not exist."
      redirect_to @current_user
    else
      id = params[:id]
      @own_profile = false
      
      if @user == @current_user
        @own_profile = true
      end
      render 'show'
    end
=end
  end
  
  
end
