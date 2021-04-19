class ApplicationController < ActionController::Base
  private 
  def current_user
    User.find_by_id(session[:current_user_id])
  end
  helper_method :current_user

end
