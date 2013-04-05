class Topic < ActiveRecord::Base
  belongs_to :event;
  belongs_to :user;
  attr_accessible :detail, :estimated_minutes, :name, :user_id
end
