class Review < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :rating, presence: true, inclusion: { in: (0..5) }, numericality: { only_integer: true }
end
