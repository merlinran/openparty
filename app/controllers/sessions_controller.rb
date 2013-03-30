class SessionsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @session = @event.sessions.new(params[:session])
    respond_to do |format|
      if @session.save
        format.js
        format.html
      else
        format.js
      end
    end
  end
end
