class UsersController < ApplicationController
  before_filter :current_user
  before_action :current_user
  
  def show
    if User.exists?(params[:id]) == false
      flash[:notice] = "The user you entered does not exist."
      redirect_to @current_user
    else
      id = params[:id]
      @own_profile = false
      @user = User.find(id)
      @dogs = Dog.where(user_id: @user.id)
  
      if @user == @current_user
        @own_profile = true
        @stars = Star.where(user_id: session[:user_id])
        @staredDogs = []
        @stars.each do |s|
        @staredDogs.push(Dog.find(s.dog_id))
        end
      end
      render 'show'
    end
  end

  def edit
    if  User.exists?(params[:id]) == false || User.find(params[:id]) != @current_user
      flash[:notice] = "You may only edit your own profile."
      redirect_to @current_user
    elsif params[:user] != nil and @current_user.update_attributes(user_params)
      flash[:notice] = "Profile successfully updated."
      redirect_to @current_user
    else
      render 'edit'
    end
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit( :oauth_token, :oauth_expires_at,:first_name, :last_name, :location, :gender, :image, :phone_number, :email, :description, :address, :zipcode, :city, :country)
    end
end
