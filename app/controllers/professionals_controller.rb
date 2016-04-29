class ProfessionalsController < ApplicationController
  before_action :set_Professionals, only: [:show, :edit, :update, :destroy]
  # GET /Professionals
  # GET /Professionals.json
  def index
    @professionals = Professional.all
  end
  
  # GET /Professionals/1
  # GET /Professionals/1.json
  def show
    @professional = Professional.find(params[:id])
  end


  def upgrade
    @professionals = Professional.all
    if  User.exists?(params[:id]) == false || User.find(params[:id]) != User.find(params[:current_user])
      flash[:notice] = "You may only upgrade your own profile."
      redirect_to User.find(params[:current_user])
    else
      render 'upgrade'
    end
    #Checks that user is correct one
    #if  User.exists?(params[:id]) == false || User.find(params[:id]) != @current_user
    #  flash[:notice] = "You may only upgrade your own profile."
    #  redirect_to @current_user
    #else
    #  render 'upgrade'
    #end
  end
  

  # GET /Professionals/new
  def new
    @user = User.find(session[:user_id])
    @professionals = Professional.all
    @professional = Professional.new(professionals_params)
    @professional.save
  end

  # GET /Professionals/1/edit
  def edit
    @professional = Professional.find(params[:id])
    @professionals = Professional.all
  end
  
  # POST /professionals/create
  def create
    @user = User.find(session[:user_id])
    @professional = Professional.new(professionals_params) 
    if @professional.save
      redirect_to '/professionals#index'
    else
      flash[:notice] = "Create Error."
      redirect_to '/professionals#index'
    end
  end  
  
  # POST /professionals/:id/update
  def update
    @professional.update_attributes(professionals_params)
    if @professional.save
      flash[:notice] = "#{@professional.name} was succesfully updated."  
      redirect_to '/professionals#index'
    else
      flash[:notice] = "Update Error."
      redirect_to '/professionals#index'
    end 
  end

  def destroy
    @user = User.find(session[:user_id])
    @professional = Professional.find(params[:id])
    @professional.destroy
    redirect_to '/professionals#index'
  end  
    


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Professionals
      @professionals = Professional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professionals_params
      params.permit(:professionals, :image, :name, :description, :motto,
        :business_id)
    end
end

