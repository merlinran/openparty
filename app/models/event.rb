class Event < ActiveRecord::Base
  has_many :enrolments
end
