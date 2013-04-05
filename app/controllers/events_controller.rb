class EventsController < ApplicationController
  skip_before_filter :ensure_logged_in, only: [ :index, :show ]
  before_filter :ensure_is_admin, except: [ :index, :show ]

  def index
    @pending_events = Event.pending_events;
    @past_events = Event.past_events;

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @events }
    end
  end

  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @event }
    end
  end
  
  def new
    @event = Event.new

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @event }
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
end
