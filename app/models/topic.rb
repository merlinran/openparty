class Topic < ActiveRecord::Base
  belongs_to :event;
  belongs_to :user;
  attr_accessible :detail, :estimated_minutes, :name, :user_id
  validates_presence_of  :detail, :estimated_minutes, :name, :user_id
  validates_uniqueness_of :name, { scope: :event_id}

end
