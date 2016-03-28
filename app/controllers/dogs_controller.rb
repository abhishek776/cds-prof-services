class DogsController < ApplicationController
  require 'dog_form_filler'
   
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.all
  end
  # GET /dogs/1
  # GET /dogs/1.json
  def show
    @dog = Dog.find(params[:id])
  end

  # GET /dogs/new
  # def new
  #   @user = User.find(session[:user_id])
  #   @dog = Dog.new
  #   @all_mixes = Mix.all
  #   @size = Size.all
  #   @energy = EnergyLevel.all
  #   @like_list = Like.all
  #   @personality_list = Personality.all
  # end
  def new
    @user = User.find(session[:user_id])
    @form_filler = DogViewHelper.new(nil, nil, false)
    @action = :create
    @method = :post

    # if params[:no_dog] == "true"
    #   @first_dog = true
    #   flash[:notice] = "Add your first dog"
    render 'new'
    # end

    # unless current_user.zipcode != nil and current_user.zipcode != "" 
    #   flash[:notice] = "Please update your zipcode to add a dog."
    #   redirect_to edit_user_path(current_user)
    # end
  end

  # GET /dogs/1/edit
  def edit
    @dog = Dog.find(params[:id])
    @action = :update
    @method = :put
    @size = Size.all
    @personality_list = Personality.all
    @all_mixes = Mix.all
    @energy = EnergyLevel.all
    @like_list = Like.all
  end
  
  def create
    @form_filler = DogViewHelper.new(nil, nil, false)
    @dog = Dog.new(@form_filler.attributes_list(dog_params))
    @dog.user_id = current_user.id

    if @dog.save      
      # add_multiple_pictures(@dog)
      redirect_to user_path(current_user)
    else
      flash[:notice] = @dog.errors.messages
      render 'new'
    end
  end
  
  # def create
  #   @user = User.find(session[:user_id])
  #   @dog = Dog.new(dog_params)
  #   @dog.user_id = session[:user_id]
  #   @size = Size.find(dog_params['size_id'])
  #   params[:mixes].each { |s| @dog.mixes << Mix.find_by_value(s)} unless params[:mixes].nil?
  #   params[:likes].each {|s|  @dog.likes << Like.find_by_value(s)} unless params[:likes].nil?
  #   params[:personalities].each { |s| @dog.personalities << Personality.find_by_value(s)}  unless params[:personalities].nil?
  #   if @dog.save
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end 
  # end
  
  def update
    @dog = Dog.find(params[:id])
    @dog.update_attributes(dog_params)
    params[:mixes].each { |s| @dog.mixes << Mix.find_by_value(s)} unless params[:mixes].nil?
    params[:likes].each {|s|  @dog.likes << Like.find_by_value(s)} unless params[:likes].nil?
    params[:personalities].each { |s| @dog.personalities << Personality.find_by_value(s)}  unless params[:personalities].nil?
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
    @dog = Dog.find(params[:id])
    # @dog.photo.destroy
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
      params.require(:dog).permit(:dog, :image, :personalities, :mixes, :likes, :name, :dob, :energy_level, :description, :motto,
        :fixed, :health, :availability, :gender, :size, :user_id)
    end
    
  # def dog_params
  #   #params.require(:dog).permit(:description, :name, :pictures)
  #   params[:dog]
  # end
end




# class DogsController < ApplicationController
#   before_action :set_dog, only: [:show, :edit, :update, :destroy]
#   # GET /dogs
#   # GET /dogs.json
#   def index
#     @dogs = Dog.all
#   end
#   # GET /dogs/1
#   # GET /dogs/1.json
#   def show
#     @dog = Dog.find(params[:id])
#   end

#   # GET /dogs/new
#   def new
#     @user = User.find(session[:user_id])
#     @dog = Dog.new
#     @all_mixes = Mix.all
#     @size = Size.all
#     @energy = EnergyLevel.all
#     @like_list = Like.all
#     @personality_list = Personality.all
#   end

#   # GET /dogs/1/edit
#   def edit
#     @dog = Dog.find(params[:id])
#     @action = :update
#     @method = :put
#     @size = Size.all
#     @personality_list = Personality.all
#     @all_mixes = Mix.all
#     @energy = EnergyLevel.all
#     @like_list = Like.all
#   end
  
#   def create
#     @user = User.find(session[:user_id])
#     @dog = Dog.new(dog_params)
#     @dog.user_id = session[:user_id]
#     @size = Size.find(dog_params['size_id'])
#     params[:mixes].each { |s| @dog.mixes << Mix.find_by_value(s)} unless params[:mixes].nil?
#     params[:likes].each {|s|  @dog.likes << Like.find_by_value(s)} unless params[:likes].nil?
#     params[:personalities].each { |s| @dog.personalities << Personality.find_by_value(s)}  unless params[:personalities].nil?
#     if @dog.save
#       redirect_to @user
#     else
#       render 'new'
#     end 
#   end
  
#   def update
#     @dog = Dog.find(params[:id])
#     @dog.update_attributes(dog_params)
#     params[:mixes].each { |s| @dog.mixes << Mix.find_by_value(s)} unless params[:mixes].nil?
#     params[:likes].each {|s|  @dog.likes << Like.find_by_value(s)} unless params[:likes].nil?
#     params[:personalities].each { |s| @dog.personalities << Personality.find_by_value(s)}  unless params[:personalities].nil?
#     if @dog.save
#       flash[:notice] = "#{@dog.name} was succesfully updated"  
#       redirect_to show     
#     else
#       flash[:notice] = "Update error"
#       redirect_to index
#     end 
#   end

#   def destroy
#     @user = User.find(session[:user_id])
#     @dog = Dog.find(params[:id])
#     # @dog.photo.destroy
#     @dog.destroy
#     redirect_to user_path(@user)
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_dog
#       @dog = Dog.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def dog_params
#       params.require(:dog).permit(:dog, :image, :personalities, :mixes, :likes, :name, :dob, :energy_level_id, :description, :motto,
#         :fixed, :health, :availability, :gender, :size_id, :user_id)
#     end
# end

