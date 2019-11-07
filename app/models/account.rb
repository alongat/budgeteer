# typed: strong
class Account < ApplicationRecord
  has_many :mtransactions
  has_many :transaction_files
end
