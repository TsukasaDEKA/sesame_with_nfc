class User < ApplicationRecord
  belongs_to :organization
  has_many :nfc_cards, :dependent => :destroy
  has_many :door_logs, :dependent => :destroy
end
