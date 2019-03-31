class Query < ApplicationRecord
  has_and_belongs_to_many :genders
  has_and_belongs_to_many :ethnicities
end
