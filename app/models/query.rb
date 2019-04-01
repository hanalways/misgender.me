class Query < ApplicationRecord
  has_and_belongs_to_many :genders
  has_and_belongs_to_many :ethnicities
  has_one :result

  accepts_nested_attributes_for :result, allow_destroy: true

  validates :username, presence: true
  validates :consent, acceptance: true
end
