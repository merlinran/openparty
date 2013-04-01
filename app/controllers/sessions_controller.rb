class SessionsController < ApplicationController
  def create
    user = User.from_auth(auth_hash)
    session[:user_id] = user.id
    flash[:notice] = "Welcome #{user.name}"
    redirect_to '/'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
