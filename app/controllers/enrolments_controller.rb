class EnrolmentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @enrolment = @event.enrolments.new(params[:enrolment])
    respond_to do |format|
      if @enrolment.save
        format.js
        format.html
      else
        format.js
      end
    end
  end
end
