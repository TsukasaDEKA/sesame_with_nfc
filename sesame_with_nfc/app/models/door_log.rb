class DoorLog < ApplicationRecord
  belongs_to :sesame_device
  belongs_to :user
end
