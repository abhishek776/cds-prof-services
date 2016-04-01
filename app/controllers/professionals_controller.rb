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

#  # GET /Professionals/new
#  def new
#    @user = User.find(session[:user_id])
#    @Professionals = Professionals.new
#    @all_mixes = Mix.all
#    @size = Size.all
#    @energy = EnergyLevel.all
#    @like_list = Like.all
#    @personality_list = Personality.all
#  end

  # GET /Professionals/1/edit
#  def edit
#    @Professionals = Professionals.find(params[:id])
#    @action = :update
#    @method = :put
#    @size = Size.all
#    @personality_list = Personality.all
#    @all_mixes = Mix.all
#    @energy = EnergyLevel.all
#    @like_list = Like.all
#  end
  
#  def create
#    @user = User.find(session[:user_id])
#    @Professionals = Professionals.new(Professionals_params)
#    @Professionals.user_id = session[:user_id]
#    @size = Size.find(Professionals_params['size_id'])
#    params[:mixes].each { |s| @Professionals.mixes << Mix.find_by_value(s)} unless params[:mixes].nil?
#    params[:likes].each {|s|  @Professionals.likes << Like.find_by_value(s)} unless params[:likes].nil?
#    params[:personalities].each { |s| @Professionals.personalities << Personality.find_by_value(s)}  unless params[:personalities].nil?
#    if @Professionals.save
#      redirect_to @user
#    else
#      render 'new'
#    end 
#  end
  
#  def update
#    @Professionals = Professionals.find(params[:id])
#    @Professionals.update_attributes(Professionals_params)
#    params[:mixes].each { |s| @Professionals.mixes << Mix.find_by_value(s)} unless params[:mixes].nil?
#    params[:likes].each {|s|  @Professionals.likes << Like.find_by_value(s)} unless params[:likes].nil?
#    params[:personalities].each { |s| @Professionals.personalities << Personality.find_by_value(s)}  unless params[:personalities].nil?
#    if @Professionals.save
#      flash[:notice] = "#{@Professionals.name} was succesfully updated"  
#       redirect_to show     
#    else
#      flash[:notice] = "Update error"
#      redirect_to index
#    end 
#  end
  
  

#  def destroy
#    @user = User.find(session[:user_id])
#    @Professionals = Professionals.find(params[:id])
#    @Professionals.destroy
    
#  end  
    


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Professionals
      @professionals = Professional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Professionals_params
      params.require(:Professionals).permit(:Professionals, :image, :name, :description, :motto,
        :business_id)
    end
end

