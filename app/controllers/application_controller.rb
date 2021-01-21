class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :user_logged_in
  before_action :authorized

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def user_logged_in
    !current_user.nil?
  end

  def authorized
    redirect_to login_path unless user_logged_in
  end

 

end
