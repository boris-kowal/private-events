class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user.nil?
      flash.now[:alert] = "Incorrect username"
      render :new
    else
      session[:username] = @user.username
      redirect_to :index, notice: "You are logged in!"
    end
  end

  def destroy
    session[:username] = nil
    redirect_to :index, notice: "You are logged out!"
  end

  private
  def session_params
    params.require(:session).permit(:username)
  end
end
