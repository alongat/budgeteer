# typed: strict
class Category < ApplicationRecord
  has_many :tags
  DEFAULT_CATEGORIES = { 
    other: 0, shopping: 1, grocries: 2, 
    eating_out: 3, transportation: 4, vacations: 5,
    housing_and_living_expenses: 6, entertainment: 7 
  }
  
  enum name: DEFAULT_CATEGORIES
end
