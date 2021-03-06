# typed: strong
# frozen_string_literal: true

class TransferTransaction < ApplicationRecord
  belongs_to :from_account, class_name: 'Account', foreign_key: 'from_account_id'
  belongs_to :to_account, class_name: 'Account', foreign_key: 'to_account_id'
end
