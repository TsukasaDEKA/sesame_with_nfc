class SesameDevice < ApplicationRecord
  belongs_to :organization
  has_many :door_log
  enum before_door_status: {open: false, close: true}
  enum after_door_status: {open: false, close: true}
end
