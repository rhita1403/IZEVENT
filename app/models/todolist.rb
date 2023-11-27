class Todolist < ApplicationRecord
  belongs_to :event

  has_many :tasks
end
