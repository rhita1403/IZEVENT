class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  validates :description, presence: true
end
