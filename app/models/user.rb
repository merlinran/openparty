class User < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :name, :email, :password, :password_confirmation, :avatar_url, :authentications_attributes
  has_many :authentications, :dependent => :delete_all
  has_many :enrolments, :dependent => :delete_all
  has_many :topics, :dependent => :delete_all
  accepts_nested_attributes_for :authentications

  auth_key :name

  validates :name, :presence => true, :uniqueness => true
  validates :email, :uniqueness => true
  #validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :alow_blank => true
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

  def admin?
    role == "admin"
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
          :avatar_url => auth[:info][:image],
          :password => rand(36**10).to_s(36))

          user.authentications.create(
            :provider => auth[:provider],
            :uid => auth[:uid])
      end

    end
  end
end
