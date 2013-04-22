# encoding: utf-8
class RegistrationsController < ApplicationController
  skip_before_filter :ensure_logged_in

  def new
    render text: "请等待下次活动" and return if !Event.current_event
    @registration = Event.current_event.registrations.new(user_id: current_user)
  end

  def create
    @registration = Registration.new(params[:registration])

    respond_to do |format|
      if @registration.save
        format.html { redirect_to checkin_url, :notice => "欢迎#{@registration.name}" }
      else
        format.html { render :action => "new" }
      end
    end

  end

  def index
  end
end
