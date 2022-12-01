class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many_attached :photos
  has_many_attached :videos
  has_many :applications
  has_many :achievements
  has_many :club_histories
  has_many :clubs, through: :club_histories

  belongs_to :sport
  has_one_attached :photo
end
