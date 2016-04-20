class BookingEventsController < ApplicationController
  before_filter :set_event
  before_action :current_user
  
  def create
    # UNCOMMENT to != when done testing
    # if current_user != User.find(Dog.find(@event.dog_id).user_id)
    #   if Booking.create(event: @event, user: current_user)
    #     redirect_to :back
    #   end
    # else redirect_to :back
    # end
    if Booking.create(event: @event, user: current_user)
      redirect_to :back
    end
  end
  
  def confirm
    puts @event.confirmed_user_id
    bookings = Booking.where(event_id: @event.id)
    bookings.each do |b|
      if b.user_id != params[:user_id]
        b.destroy
      end
    end
    @event.confirmed_user_id = params[:user_id]
    @event.save!
    puts @event.confirmed_user_id
    puts @event.id
    # redirect_to :back 
    redirect_to :back
    # else
    #   flash[:notice] = "Cannot confirm this user"
    #   redirect_to back
    # end
  end
  
  def destroy
    Booking.where(event_id: @event.id, user_id: current_user.id).first.destroy
    if @event.confirmed_user_id
       @event.confirmed_user_id = nil
      @event.save!
    end
    redirect_to :back
  end
  
  private
  
  def set_event
    @event = Event.find(params[:event_id])
  end
  
  # def booking_params
  #   params.require(:booking).permit(:user_id, :event_id)
  # end
    
end