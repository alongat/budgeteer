# typed: true
# frozen_string_literal: true

class Mtransaction< ApplicationRecord
  belongs_to :account
  after_create :assign_category

  def assign_category

  end
end
