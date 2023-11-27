class Event < ApplicationRecord
  belongs_to :user
  has_many :participations
  has_many :reviews
  has_many :users, through: :participations

  validates :title, presence: true, uniqueness: true
  validates :date, presence: true
end
