class User < ActiveRecord::Base
  include Tokenable

  attr_accessible :name, :email, :password, :password_confirmation, :time_zone
  has_secure_password

  has_many :sites, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_presence_of :time_zone

  before_create { generate_token(:auth_token) }
  after_save { Rails.cache.write("users/token/#{auth_token}", self) }
  after_destroy { Rails.cache.delete("users/token/#{auth_token}") }

  def self.fetch_by_auth_token(auth_token)
    Rails.cache.fetch("users/token/#{auth_token}") do
      find_by_auth_token(auth_token)
    end
  end

  def to_s
    name || email
  end
end
