class Sport < ApplicationRecord
  has_many :users
  has_many :clubs
  has_one_attached :photo
end
