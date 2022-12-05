class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many_attached :photos
  has_many_attached :videos
  has_many :applications, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_many :club_histories, dependent: :destroy
  has_one :clubs, through: :club_histories
  has_many :owned_clubs, foreign_key: 'user_id', class_name: 'Club', dependent: :destroy
  belongs_to :sport
  has_one_attached :photo

  def titles
    #return intances of achiev that belongs to user that are title
    achievements.select(&:title?)
  end

  def honors
    achievements.select(&:honor?)
  end
end
