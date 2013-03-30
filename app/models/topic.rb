class Topic < ActiveRecord::Base
  belongs_to :event;
  attr_accessible :detail, :estimated_minutes, :name, :poster_url, :submitter
end
