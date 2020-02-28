class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  validates :scheduled_time, :location, presence: true
end
