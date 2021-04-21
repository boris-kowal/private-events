class UsersController < ApplicationController

  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @events_past = current_user.events_attended.past
    @events_upcoming = current_user.events_attended.upcoming
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end

end
