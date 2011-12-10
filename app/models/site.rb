class Site < ActiveRecord::Base
  include Tokenable
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :url
  validates_presence_of :time_zone

  before_create { generate_token(:token, 12) }
end
