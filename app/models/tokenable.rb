module Tokenable
  extend ActiveSupport::Concern

  included do
    def generate_token(column, length=16)
      begin
        self[column] = SecureRandom.urlsafe_base64(length)
      end while self.class.exists?(column => self[column])
    end
  end
end