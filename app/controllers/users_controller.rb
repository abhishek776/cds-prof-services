class UsersController < ApplicationController
  def show
      uid = params[:id]
      @user = User.find_by_uid(uid)
      logger.info("I AM HERE")
      logger.info(@user.first_name)
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
