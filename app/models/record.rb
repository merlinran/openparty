class Record < ActiveRecord::Base
  attr_accessible :user_id, :event_id, :text, :title

  belongs_to :user
  belongs_to :event

  validates_presence_of :user_id, :event_id, :text, :title

end
