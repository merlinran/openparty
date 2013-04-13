class Event < ActiveRecord::Base
  has_many :enrolments;
  has_many :topics;

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

end
