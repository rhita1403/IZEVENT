class Task < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :description, presence: true, uniqueness: true
end
