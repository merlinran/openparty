class Registration < ActiveRecord::Base
  attr_accessible :email, :intro, :name, :qq, :user_id, :weibo
  validates_presence_of :email, :name
  validates_uniqueness_of :email
end
