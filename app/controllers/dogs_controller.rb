class DogsController < ApplicationController
  require 'dog_form_filler'
   
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]
  
  before_filter :current_user
  # GET /dogs
  def index
    @dogs = Dog.all
  end
 
  # GET /dogs/1
  def show
    @dog = Dog.find(params[:id])
    @parent = User.find(@dog.user_id)
    
  end

  # GET /dogs/new
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

  # GET /dogs/:id/edit
  def edit
    @action = :update
    @method = :put
    set_dog_types
  end
  
  # POST /dogs/create
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
      params.require(:dog).permit(:dog, :image, :personalities, :mixes, :likes, :name, :dob, :energy_level, :description, :motto,
        :fixed, :health, :availability, :gender, :size, :user_id)
    end
    
    def require_login
      unless current_user
        redirect_to home_path
      end
    end
    
end

