# typed: true
# frozen_string_literal: true

class Tag < ApplicationRecord
  DEFAULT_TAG = '_UNKNOWN_'

  has_and_belongs_to_many :locations
  has_many :mtransactions, through: :locations
  belongs_to :category

  def self.default_category
    Tag.find_by_name(DEFAULT_TAG)
  end

  def self.tags_without_categories
    Tag.where(category_id: null)
  end

  def assign_category!(required_name)
    c = Category.find_by(name: required_name)
    raise "Category not found!" unless c.present?

    self.category = c
    save!
  end
end
