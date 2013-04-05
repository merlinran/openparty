class EnrolmentsController < ApplicationController
  def create
    @enrolment = current_user.enrolments.new(event_id: params[:event_id])
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
