class Event < ApplicationRecord
  belongs_to :user
  has_one :chatroom, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :users, through: :participations
  has_one_attached :photo

  validates :title, presence: true, uniqueness: true
  validates :date, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
