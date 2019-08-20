class User < ApplicationRecord
  belongs_to :organization
  has_many :nfc_cards
  has_many :door_logs
end
