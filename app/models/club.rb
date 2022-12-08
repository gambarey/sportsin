class Club < ApplicationRecord
  belongs_to :sport
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :offers, dependent: :destroy
  has_many :applications, through: :offers
  has_many :club_histories, dependent: :destroy
  has_many :users, through: :club_histories, dependent: :destroy
  has_one_attached :photo
end
