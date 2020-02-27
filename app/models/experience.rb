class Experience < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, :gender, :age, :location, presence: true
end
