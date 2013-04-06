class Enrolment < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  validates_presence_of :user_id, :event_id
  validates_uniqueness_of :user_id, scope: :event_id
end
