class SesameDevice < ApplicationRecord
  belongs_to :organization
  has_many :door_log, dependent: :destroy
  enum door_status: { open: false, close: true }
  validates :organization_id, presence: true
  validates :device_id, presence: true
  validates :nickname, presence: true
  validates :serial, presence: true
end
