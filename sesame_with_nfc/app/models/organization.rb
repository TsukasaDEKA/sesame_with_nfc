class Organization < ApplicationRecord
  has_many :user
  has_many :sesame_device
end
