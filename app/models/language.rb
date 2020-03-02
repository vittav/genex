class Language < ApplicationRecord
  belongs_to :experience

  validates :name, :level, presence: true


  # include PgSearch::Model
  # multisearchable against: [:name]
end
