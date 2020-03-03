class User < ApplicationRecord
  SIGN_UP_ATTRS = %i[
    email
    first_name
    last_name
    age
    location
    occupation
    civil_state
    avatar
  ]

  EDIT_ATTRS = %i[
    age
    location
    occupation
    civil_state
    avatar
  ]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :meetings
  has_many :experiences
  has_one_attached :avatar
  # has_many :experiences, through :meetings
end
