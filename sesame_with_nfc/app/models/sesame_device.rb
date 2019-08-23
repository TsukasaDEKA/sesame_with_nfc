class SesameDevice < ApplicationRecord
  belongs_to :organization
  has_many :door_log, :dependent => :destroy
  enum door_status: { open: false, close: true }
end
