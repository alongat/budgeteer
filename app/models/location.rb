# typed: false
class Location < ApplicationRecord
  has_many :mtransactions
  has_and_belongs_to_many :categories

  def relevant_categories
    categories.any? ? categories : [Category.default_category]
  end
end
