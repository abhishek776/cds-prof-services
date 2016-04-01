class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  
  # GET /dogs
  def index
    @dogs = Dog.all
  end
 
  # GET /dogs/1
  def show
  end

  # GET /dogs/new
  def new
    @user = User.find(session[:user_id])
    @action = :create
    @method = :post
    @all_mixes = Mix.all
    @size = Size.all
    @energy = EnergyLevel.all
    @like_list = Like.all
    @personality_list = Personality.all
  end

  # GET /dogs/:id/edit
  def edit
    @action = :update
    @method = :put
    @size = Size.all
    @personality_list = Personality.all
    @all_mixes = Mix.all
    @energy = EnergyLevel.all
    @like_list = Like.all
  end
  
  # POST /dogs/create
  def create
    @user = User.find(session[:user_id])
    @dog = Dog.new(dog_params)
    @dog.user_id = session[:user_id]
    @size = Size.find(dog_params['size_id'])
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
      flash[:notice] = "#{@dog.name} was succesfully updated"  
      redirect_to show     
    else
      flash[:notice] = "Update error"
      redirect_to index
    end 
  end

  def destroy
    @user = User.find(session[:user_id])
    @dog.destroy
    redirect_to user_path(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:dog, :image, :personalities, :mixes, :likes, :name, :dob, :energy_level_id, :description, :motto,
        :fixed, :health, :availability, :gender, :size_id, :user_id)
    end
end

