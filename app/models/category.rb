# typed: false
# frozen_string_literal: true

class Category < ApplicationRecord
  DEFAULT_CATEGORY = '_UNKNOWN_'

  has_and_belongs_to_many :locations
  has_many :mtransactions, through: :locations

  def self.default_category
    Category.find_by_name(DEFAULT_CATEGORY)
  end
end
