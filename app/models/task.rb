class Task < ApplicationRecord
  belongs_to :user
  belongs_to :todolist

  validates :description, presence: true, uniqueness: true
end
