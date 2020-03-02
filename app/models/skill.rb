class Skill < ApplicationRecord
  belongs_to :experience

  validates :name, :description, :level, presence: true

  # include PgSearch::Model
  # multisearchable against: [:name]
end
