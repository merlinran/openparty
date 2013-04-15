class TopicsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @topic = @event.topics.new(params[:topic].merge(user_id: current_user.id))
    respond_to do |format|
      if @topic.save
        format.js
        format.html
      else
        format.js
      end
    end
  end

  def show
    @event = Event.find(params[:event_id])
    @topic = @event.topics.find(params[:id])
  end
end
