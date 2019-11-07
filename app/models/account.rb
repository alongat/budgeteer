# typed: strict
class Account < ApplicationRecord
  has_many :mtransactions
end
