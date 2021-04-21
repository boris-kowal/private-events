class SubscriptionsController < ApplicationController

  before_action :require_login, only: [:new, :create]
  before_action :require_invite

  def require_invite
    @event = Event.find_by_id(params[:id])
    guest_list = @event.invited_users.split(',')
    if !guest_list.include?(current_user.username)
      flash[:alert] = "You are not invited to this event!"
      redirect_to :index
    end
  end

  def new
    @event = Event.find_by_id(params[:id])
    @subscription = Subscription.new
  end

  def create
    @event = Event.find_by_id(params[:id])
    @subscription = Subscription.new(events_attended_id: @event.id, attendees_id: current_user.id)
    if @subscription.save
      flash[:notice] = "You are now joining this event!"
      redirect_to :index
    else
      flash[:alert] = "You already suscribed to this event!"
      redirect_to @event
    end
  end

end
