class StarredDogsController < ApplicationController
  before_filter :set_dog
  before_action :current_user
  
  # def create
  #   if Star.create(dog: @dog, user: current_user)
  #     redirect_to :back
  #   end
  # end
  
  def create
    if current_user != User.find(@dog.user_id)
      if Star.create(dog: @dog, user: current_user)
        redirect_to :back
      end
    else redirect_to :back
    end
  end
  
  def destroy
    Star.where(dog_id: @dog.id, user_id: current_user.id).first.destroy
    redirect_to :back
  end
  
  private
  
  def set_dog
    @dog = Dog.find(params[:dog_id])
  end
end