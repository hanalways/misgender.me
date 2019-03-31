class Query < ApplicationRecord
  has_and_belongs_to_many :genders
  has_and_belongs_to_many :ethnicities

  validates :consent, acceptance: true
  validates :username, presence: true
end
