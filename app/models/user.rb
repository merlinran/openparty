class User < ActiveRecord::Base
  attr_accessible :name, :email, :avatar_url, :authentications_attributes
  has_many :authentications, :dependent => :delete_all
  accepts_nested_attributes_for :authentications

  validates :name, :presence => true, :uniqueness => true
  validates :email, :uniqueness => true
  validates :avatar_url, :format => { 
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }

  def add_auth(auth)
    authentications.create(:provider => auth[:provider],
                           :uid => auth[:uid])
  end

  def avatar_url
    self[:avatar_url] || "http://railscasts.com/assets/icons/rss-04cb962054caa957a6fa3924c48594d8.png"
  end

  class << self
    def from_auth(auth)
      locate_auth(auth) || locate_name(auth) || create_auth(auth)
    end

    def locate_auth(auth)
      Authentication.find_by_provider_and_uid(auth[:provider],
                                              auth[:uid]).try(:user)
    end

    def locate_name(auth)
      user = find_by_name(auth[:info][:name])
      return unless user
      user.add_auth(auth)
      user
    end

    def create_auth(auth)
      User.transaction do
        user = create!(
          :name => auth[:info][:name],
          :email => auth[:info][:email],
          :avatar_url => auth[:info][:image])

          user.authentications.create(
            :provider => auth[:provider],
            :uid => auth[:uid])
      end

    end
  end
end
