class Chatroom < ApplicationRecord
  belongs_to :event
  has_many :messages

  validates :name, presence: true
end
