class Task < ApplicationRecord
  belongs_to :user
  belongs_to :todolist
end
