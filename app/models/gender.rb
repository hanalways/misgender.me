class Gender < ApplicationRecord
  has_and_belongs_to_many :queries
end
