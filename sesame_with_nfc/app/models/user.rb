class User < ApplicationRecord
  belongs_to :organization
  has_many :nfc_cards, dependent: :destroy
  has_many :door_logs, dependent: :destroy
  validates :organization_id, presence: true
  validates :name, presence: true
  validates :auth_key, presence: true
  validates :password_for_cms, presence: true
  validates :roll, presence: true
end
