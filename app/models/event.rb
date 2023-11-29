class Event < ApplicationRecord
  belongs_to :user
  has_one :chatroom, dependent: :destroy
  has_many :participations
  has_many :reviews
  has_many :tasks
  has_many :users, through: :participations

  validates :title, presence: true, uniqueness: true
  validates :date, presence: true

  has_one_attached :photo
end
