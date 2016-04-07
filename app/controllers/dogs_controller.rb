class DogsController < ApplicationController

  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]
  
  before_filter :current_user
  # GET /dogs
  def index
    @dogs = Dog.all
    filter = params[:filter] || {}
    gender = filter[:gender] || ["Male", "Female"]
    @dogs = @dogs.where(gender: gender)
    if filter[:has_event] and filter[:has_event] == "1"
      @dogs = @dogs.select {|x| x.future_events?}
    end
  end
 
  # GET /dogs/1
  def show
    @dog = Dog.find(params[:id])
    @parent = User.find(@dog.user_id)
    
  end

  # GET /dogs/new
  def new
    @user = current_user
    @action = :create
    @method = :post
    set_dog_types
    render 'new'
  end

  # GET /dogs/:id/edit
  def edit
    @action = :update
    @method = :put
    set_dog_types
  end
  
  # POST /dogs/create
  def create
    @user = current_user
    @dog = Dog.new(dog_params)
    @dog.user_id = @user.id
    @dog.set_mix_like_personality(params[:mixes], params[:likes], params[:personalities])
    if @dog.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  # POST /dogs/:id/update
  def update
    @dog.update_attributes(dog_params)
    @dog.set_mix_like_personality(params[:mixes], params[:likes], params[:personalities])
    if @dog.save
      flash[:notice] = "#{@dog.name} was succesfully updated."  
      puts show.nil?
      redirect_to show
    else
      flash[:notice] = "Update Error."
      redirect_to index
    end 
  end

  def destroy
    @user = current_user
    @dog.destroy
    redirect_to user_path(@user)
  end

  private

    def set_dog
      @dog = Dog.find(params[:id])
    end
    
    def set_dog_types
      @all_mixes = Mix.all
      @size = Size.all
      @energy = EnergyLevel.all
      @like_list = Like.all
      @personality_list = Personality.all
    end

    def dog_params
      params.require(:dog).permit(:dog, :image, :personalities, :mixes, :likes, :name, :dob, :energy_level_id, :description, :motto,
        :fixed, :health, :availability, :gender, :size_id, :user_id)
    end
    
    def require_login
      unless current_user
        redirect_to home_path
      end
    end
    
end

