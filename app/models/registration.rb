# encoding: utf-8
class Registration < ActiveRecord::Base
  attr_accessible :email, :intro, :name, :qq, :user_id, :weibo, :douban
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :name
end
