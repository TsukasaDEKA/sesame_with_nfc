class Organization < ApplicationRecord
  has_many :user, dependent: :destroy
  has_many :sesame_device, dependent: :destroy

  has_secure_token :auth_key

  validates :name, presence: true
  validates :sesame_api_key, presence: true

  before_save :encrypt_api_key
  after_find :decrypt_api_key

  def encrypt_api_key
    self.sesame_api_key = encrypt(sesame_api_key)
  end

  def decrypt_api_key
    self.sesame_api_key = decrypt(sesame_api_key)
  end

  # TODO: sesame api key format
  # validates :sesame_api_key, format: {}
end
