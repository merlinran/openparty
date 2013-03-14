class EnrolmentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @enrolment = @event.enrolments.new(params[:enrolment])
  end
  respond_to do |format|
    if @enrolment.save
      format.js
      format.html
    else
    end
  end
end
