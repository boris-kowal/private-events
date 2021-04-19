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
      session[:current_user_id] = @user.id
      redirect_to :index, notice: "You are logged in!"
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to :index, notice: "You are logged out!"
  end
  
end
