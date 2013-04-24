# encoding: utf-8
class SessionsController < ApplicationController
  skip_before_filter :ensure_logged_in

  def new
    session[:referer] = request.referer
  end

  def create
    p request.env['omniauth.auth'].to_yaml
    debugger
    if auth_hash[:provider] == "identity"
      user = User.find(auth_hash[:uid])
    else
      user = User.from_auth(auth_hash)
    end
    session[:user_id] = user.id
    redirect_to session[:referer] || root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to session[:referer] || root_url

  end

  def failure
    redirect_to root_url, alert: "登录失败，请重试"
  end
  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
