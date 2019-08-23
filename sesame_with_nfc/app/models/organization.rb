class Organization < ApplicationRecord
  has_many :user, :dependent => :destroy
  has_many :sesame_device, :dependent => :destroy
end
