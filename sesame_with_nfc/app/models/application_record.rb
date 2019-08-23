class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def encrypt(value)
    key = Rails.application.credentials.secret_key
    Rails.application.message_verifier(key).generate({token: value})
  end

  def decrypt(value)
    key = Rails.application.credentials.secret_key
    Rails.application.message_verifier(key).verify(value)[:token]
  end
end
