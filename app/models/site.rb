class Site < ActiveRecord::Base
  include Tokenable
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :url
  validates_presence_of :time_zone

  before_create { generate_token(:token, 12) }
  after_save { Rails.cache.write("sites/token/#{token}", self) }
  after_destroy { Rails.cache.delete("sites/token/#{token}") }

  def self.fetch_from_token(token)
    Rails.cache.fetch("sites/token/#{token}") do
      find_by_token(token)
    end
  end
end
