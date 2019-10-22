class User < ApplicationRecord
  belongs_to :organization
  has_many :nfc_cards, dependent: :destroy
  has_many :door_logs, dependent: :destroy

  enum roll: { system_admin: 0, organization_admin: 1, general_user: 2 }

  has_secure_token :auth_key

  validates :organization_id, presence: true
  validates :name, presence: true
  validates :password_for_cms, presence: true
  validates :roll, presence: true

  before_save :encrypt_password_for_cms
  after_find :decrypt_password_for_cms

  def encrypt_password_for_cms
    self.password_for_cms = encrypt(password_for_cms)
  end

  def decrypt_password_for_cms
    self.password_for_cms = decrypt(password_for_cms)
  end

end
