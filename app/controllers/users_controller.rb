class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:username] = @user.username
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by(params[:id])
  end

  # def sign_in
  #   @user = User.find_by(:id)
  # end

  # def create_session
  #   @user = User.find_by(username: params[:username])
  #   if @user.nil?
  #     render :sign_in
  #   else
  #     session[:username] = @user.username
  #     redirect_to @user
  #   end
  # end

  # def sign_out
  #   reset_session
  # end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end

end
