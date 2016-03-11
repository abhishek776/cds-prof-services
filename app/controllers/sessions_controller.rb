class SessionsController < ApplicationController
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path    
  end

  def handle_failure
    flash[:notice] = "Something went wrong with the authentication. Please try again."
    redirect_to root_path
  end
  
  def login
    if params[:user]
      @user = User.find(params[:user])
      @user.update_credentials(params[:auth][:credentials])
      session[:user_id] = @user.uid
      redirect_to user_path(:id => @user.uid)
    else
      @new_user = User.create()
      @new_user.update_credentials(params[:auth][:credentials])
      @new_user.facebook_info_update(params[:auth])
      session[:user_id] = @new_user.uid
      redirect_to root_path
    end
  end

  def handle_auth 
    uid = request.env["omniauth.auth"][:uid]
    @user = User.find_by_uid(uid)
    redirect_to login_path(:user => @user, :auth => request.env["omniauth.auth"])
  end

end
