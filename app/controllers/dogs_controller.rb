class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.all
  end
  # GET /dogs/1
  # GET /dogs/1.json
  def show
    @user = User.find(session[:user_id])
    @dog = Dog.find(params[:id])
    @dogs = Dog.all
  end

  # GET /dogs/new
  def new
    @user = User.find(session[:user_id])
    @dog = Dog.new
    @all_mixes = Mix.all
    @size = Size.all
    @energy = EnergyLevel.all
    @like_list = Like.all
    @personality_list = Personality.all
  end

  # GET /dogs/1/edit
  def edit
    @dog = Dog.find(params[:id])
    @pictures = @dog.image
    @action = :update
    @method = :put
  end
  
  def create
    @user = User.find(session[:user_id])
    @dog = Dog.new(dog_params)
    @dog.user_id = session[:user_id]
    @size = Size.find(dog_params['size_id'])
    params[:mixes].each { |s| @dog.mixes << Mix.find_by_value(s)} unless params[:mixes].nil?
    params[:likes].each {|s|  @dog.likes << Like.find_by_value(s)} unless params[:likes].nil?
    params[:personalities].each { |s| @dog.personalities << Personality.find_by_value(s)}  unless params[:personalities].nil?
    if @dog.save
      redirect_to @user
    else
      render 'new'
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:dog, :image, :personalities, :mixes, :likes, :name, :dob, :energy_level_id, :description, :motto, :fixed, :health, :availability, :gender, :size_id, :energy_level_id, :user_id)
    end
end

