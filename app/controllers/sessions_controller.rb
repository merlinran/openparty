# encoding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_auth(auth_hash)
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def failure
    redirect_to root_url, alert: "登录失败，请重试"
  end
  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
