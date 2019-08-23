class NfcCard < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates :uid, presence: true
  validates :password, presence: true
end
