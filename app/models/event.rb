class Event < ActiveRecord::Base
  has_many :enrolments

  def held?
    self.hold_at < Date.today();
  end

  def self.past_events
    self.where(held?: true)
  end

  def self.current_events
    self.where(held?: false)
  end

end
