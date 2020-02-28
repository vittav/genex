class Language < ApplicationRecord
  belongs_to :experience

  validates :name, :level, presence: true
end
