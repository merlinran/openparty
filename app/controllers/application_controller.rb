# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :logged_in?, :current_user
  before_filter :ensure_logged_in

  private
  def ensure_is_admin
    unless current_user.is_admin?
      redirect_to request.referer || root_url, notice: "需要管理员身份"
    end
  end

  def ensure_logged_in
    unless logged_in?
      redirect_to login_url, notice: "请先登录"
    end
  end

  def logged_in?
    !!current_user  
  end

  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end  
end
