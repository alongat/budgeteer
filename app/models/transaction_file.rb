# typed: strict
# frozen_string_literal: true

class TransactionFile < ApplicationRecord
  has_one :file
end
