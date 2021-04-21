class SubscriptionsController < ApplicationController

  before_action :require_login, only: [:new, :create]

  def new
    @event = Event.find_by_id(params[:id])
    @subscription = Subscription.new
  end

  def create
    @event = Event.find_by_id(params[:id])
    @subscription = Subscription.new(events_attended_id: @event.id, attendees_id: current_user.id)
    if @subscription.save
      redirect_to :index
    else
      flash[:alert] = "You already suscribed to this event!"
      redirect_to @event
    end
  end

end
