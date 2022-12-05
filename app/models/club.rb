class Club < ApplicationRecord
  belongs_to :sport
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :offers
  has_many :club_histories
  has_many :users, through: :club_histories
  has_one_attached :photo
end
