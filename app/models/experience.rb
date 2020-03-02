class Experience < ApplicationRecord
  belongs_to :user
  has_many :meetings, dependent: :destroy
  has_many :languages , dependent: :destroy
  has_many :skills, dependent: :destroy

  validates :first_name, :last_name, :gender, :age, :location, presence: true
  has_one_attached :photo
  validates :first_name, uniqueness: { scope: :last_name,
    message: "There is already an entry with this name" }

    include PgSearch::Model
    # multisearchable against: [:first_name, :last_name, :location]
    pg_search_scope :global_search,
      against: [:first_name, :last_name, :location],
      associated_against: {
        languages: :name,
        skills: [:name]
      },
      using: {
        tsearch: { prefix: true}
      }
end
