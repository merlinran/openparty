# encoding: utf-8
class RegistrationsController < ApplicationController
  skip_before_filter :ensure_logged_in

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(params[:registration])

    respond_to do |format|
      if @registration.save
        format.html { redirect_to checkin_url, :notice => "欢迎#{@registration.name}。下一位：" }
      else
        format.html { render :action => "new" }
      end
    end
 
  end

  def index
  end
end
