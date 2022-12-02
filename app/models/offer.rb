class Offer < ApplicationRecord
  belongs_to :club
  has_many :applications

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
