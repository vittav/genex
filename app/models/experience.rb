class Experience < ApplicationRecord
  belongs_to :user
  has_many :meetings, dependent: :destroy
  has_many :languages , dependent: :destroy
  has_many :skills, dependent: :destroy
  # has_many :users, through :meetings

  validates :first_name, :last_name, :gender, :age, :location, presence: true
  has_one_attached :photo
  validates :first_name, uniqueness: { scope: :last_name,
    message: "There is already an entry with this name" }
end
