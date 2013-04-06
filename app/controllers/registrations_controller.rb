class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(params[:registration])

    respond_to do |format|
      if @registration.save
        format.html { redirect_to new_registration_url, :notice => 'registration was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
 
  end

  def index
  end
end
