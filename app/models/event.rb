class Event < ActiveRecord::Base
  has_many :enrolments, :dependent => :delete_all
  has_many :topics, :dependent => :delete_all
  has_many :records, :dependent => :delete_all
  has_many :registrations, :dependent => :delete_all


  validates_presence_of :name, :hold_date, :location, :poster_url, :detail;

  def past_event?
    self.hold_date < Date.today
  end

  def pending_event?
    !past_event?
  end

  def self.past_events
    self.where("hold_date < ?", Date.today).order("hold_date DESC")
  end

  def self.pending_events
    self.where("hold_date >= ?", Date.today).order("hold_date DESC")
  end

  def self.past_event_names
    past_events.select("name, id").collect { |e| e.attributes.values }
  end

  def self.current_event
    pending_events.last
  end

end
