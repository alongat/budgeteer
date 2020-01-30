# typed: strict
# frozen_string_literal: true

class TransactionFile < ApplicationRecord
  has_one_attached :original_file
  has_one_attached :parsed_file
end
