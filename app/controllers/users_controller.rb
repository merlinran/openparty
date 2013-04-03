# encoding: utf-8
class UsersController < ApplicationController
  def new
    @user = env['omniauth.identity'] || User.new
  end

  def create
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update_attributes(params[:user])
    redirect_to root_url
  end

  def destroy
    current_user.destroy
    redirect_to logout_url, notice: '成功解除注册，欢迎再次光临'
  end

end
