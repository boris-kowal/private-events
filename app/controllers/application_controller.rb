class ApplicationController < ActionController::Base
  private 
  def current_user
    User.find_by_id(session[:current_user_id])
  end

  def require_login
    if session[:current_user_id].nil?
      flash[:alert] = "You must be logged in to view this section"
      redirect_to "/login"
    end
  end
  helper_method :current_user

end
