class Offer < ApplicationRecord
  belongs_to :club
  has_many :applications
end
