class EnrolmentsController < ApplicationController
  def create
    debugger
    @enrolment = current_user.enrolments.create(event_id: params[:event_id])
  end
end
