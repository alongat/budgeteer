# frozen_string_literal: true

class TransactionFile < ApplicationRecord
  has_one_attached :file
end
