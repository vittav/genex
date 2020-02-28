class Experience < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, :gender, :age, :location, presence: true
  has_one_attached :photo
  validates :first_name, uniqueness: { scope: :last_name,
    message: "There is alrady an entry with this first_name + last_name" }
end
