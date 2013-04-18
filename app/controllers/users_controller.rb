# encoding: utf-8
class UsersController < ApplicationController
  skip_before_filter :ensure_logged_in, only: [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = env['omniauth.identity'] || User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url
    else
      render action: "new"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_by_hash(params[:user])
    if @user.errors.any?
      render action: "edit"
    else
      redirect_to root_url
    end
  end

  def destroy
    current_user.destroy
    redirect_to logout_url, notice: '成功解除注册，欢迎再次光临'
  end

end
