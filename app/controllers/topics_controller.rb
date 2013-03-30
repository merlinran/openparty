class TopicsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @topic = @event.topics.new(params[:topic])
    respond_to do |format|
      if @topic.save
        format.js
        format.html
      else
        format.js
      end
    end
  end
end
