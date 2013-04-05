# encoding: utf-8
class UsersController < ApplicationController
  skip_before_filter :ensure_logged_in, only: [:new, :create]

  def new
    @user = env['omniauth.identity'] || User.new
  end

  def create
  end

  def edit
    @user = current_user
  end

  def update
    uploaded_io = params[:user][:avatar]
    file_full_path = File.join('uploads', uploaded_io.original_filename)
    File.open(Rails.root.join('public', file_full_path), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    current_user.update_attributes(
      params[:user].except(:avatar).merge(avatar_url: '/' + file_full_path.to_s))

    redirect_to root_url
  end

  def destroy
    current_user.destroy
    redirect_to logout_url, notice: '成功解除注册，欢迎再次光临'
  end

end
