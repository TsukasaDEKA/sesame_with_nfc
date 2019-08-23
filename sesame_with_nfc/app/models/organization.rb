class Organization < ApplicationRecord
  has_many :user, dependent: :destroy
  has_many :sesame_device, dependent: :destroy

  validates :name, presence: true
  validates :auth_key, presence: true
  validates :sesame_api_key, presence: true

  before_save :encrypt_auth_key
  before_save :encrypt_api_key

  after_save :decrypt_auth_key
  after_save :decrypt_api_key

  def encrypt_auth_key
    self.auth_key = encrypt(:auth_key)
  end

  def encrypt_api_key
    self.sesame_api_key = encrypt(:sesame_api_key)
  end

  def decrypt_auth_key
    self.auth_key = decrypt(self.auth_key)
  end

  def decrypt_api_key
    self.sesame_api_key = decrypt(self.sesame_api_key)
  end
  # TODO: sesame api key format
  # validates :sesame_api_key, format: {}
end
