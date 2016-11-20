class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user


  def require_login
    session[:redirect_to] = request.path
    redirect_to log_in_path_url unless current_user
  end
end
