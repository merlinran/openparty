class Event < ActiveRecord::Base
  has_many :enrolments

  def self.past_events
    self.where("hold_date < ?", Date.today).order("hold_date DESC");
  end

  def self.pending_events
    self.where("hold_date >= ?", Date.today).order("hold_date DESC");
  end

end
