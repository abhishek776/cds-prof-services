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
  
  def destroy
    Booking.where(event_id: @event.id, user_id: current_user.id).first.destroy
    redirect_to :back
  end
  
  private
  
  def set_event
    @event = Event.find(params[:event_id])
  end
end