class Club < ApplicationRecord
  belongs_to :sport
  has_many :offers
end
