class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :logged_in?, :current_user, :admin?
  before_filter :ensure_logged_in

  private
  def ensure_is_admin
    unless admin?
      redirect_to request.referer || root_url, error: I18n.t(:admin_required)
    end
  end

  def ensure_logged_in
    unless logged_in?
      redirect_to login_url, error: I18n.t(:please_login)
    end
  end

  def logged_in?
    !!current_user  
  end

  def admin?
    current_user && current_user.admin?
  end

  def current_user  
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]  
  end  
end
