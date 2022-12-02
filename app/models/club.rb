class Club < ApplicationRecord
  belongs_to :sport
  has_many :offers
  has_many :club_histories
  has_one_attached :photo
end
