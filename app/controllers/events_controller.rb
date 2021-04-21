class EventsController < ApplicationController

  before_action :require_login, only: [:show, :new, :create]

  def index
    @events_past = Event.past
    @events_upcoming = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events_created.new(event_params)
    if @event.save
      redirect_to :index
    else
      render :new
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
  end

  private
  
  def event_params
    params.require(:event).permit(:name, :place, :date, :description)
  end
end
