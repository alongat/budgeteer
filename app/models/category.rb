# typed: strict
class Category < ApplicationRecord
  has_many :tags

  enum type: %i(shopping grocries eating_out transportation vacations housing_and_living_expenses entertainment)
end
