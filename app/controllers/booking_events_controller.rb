class BookingEventsController < ApplicationController
  before_filter :set_event
  before_action :current_user
  
  def create
    Booking.create(event: @event, user: current_user)
    redirect_to :back
  end
  
  def confirm
    puts @event.confirmed_user_id
    bookings = Booking.where(event_id: @event.id)
    bookings.each do |b|
      b.destroy
    end
    @user = User.find(params[:user_id])
    Booking.create(event: @event, user: @user)
    @event.confirmed_user_id = params[:user_id]
    @event.save
    redirect_to :back
  end
  
  def destroy
    Booking.where(event_id: @event.id, user_id: params[:user_id]).first.destroy
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
end