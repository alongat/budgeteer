# typed: strong
# frozen_string_literal: true

class Mtransaction < ApplicationRecord
  belongs_to :account
  belongs_to :location

  has_many :categories, through: :location
end
