class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #判斷使用者
  helper_method :current_user, :logged_in?
  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
  

end
