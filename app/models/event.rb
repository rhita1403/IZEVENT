class Event < ApplicationRecord
  belongs_to :user
  has_one :chatroom, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tasks,dependent: :destroy
  has_many :users, through: :participations

  validates :title, presence: true, uniqueness: true
  validates :date, presence: true
end
