class Club < ApplicationRecord
  belongs_to :sport
  has_many :offers
  has_one_attached :photo
end
