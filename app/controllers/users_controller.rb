class UsersController < ApplicationController
  def show
      id = params[:id]
      @user = User.find_by_uid(id)
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
