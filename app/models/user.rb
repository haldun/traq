class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :time_zone
  has_secure_password

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_presence_of :time_zone

  def self.fetch_by_auth_token(auth_token)
    Rails.cache.fetch("users/token/#{auth_token}") do
      find_by_auth_token(auth_token)
    end
  end

  def to_s
    name || email
  end
end
