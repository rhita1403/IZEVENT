class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_many :messages
  has_many :participations
  has_many :reviews
  has_many :events, through: :participations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def to_label
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name[0]}.#{last_name[0]}.".upcase
  end

  def initials_small
    "#{first_name[0]}.#{last_name[0]}.".downcase
  end

  def random_color
    "#" + SecureRandom.hex(3)
  end

  def fixed_color
    "#00FAFF"
  end

  def blue_color
    "#4783F9"
  end
end

