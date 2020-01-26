# typed: true
class Account < ApplicationRecord
  has_many :mtransactions
  has_many :outbound_transfer_transactions, class_name: 'TransferTransactions', foreign_key: 'from_account_id'
  has_many :inbound_transfer_transactions, class_name: 'TransferTransactions', foreign_key: 'to_account_id'
  has_many :transaction_files

  def current_amount
    base_amount + less
      mtransactions.pluck(:amount).sum -
      outbound_transfer_transactions.pluck(:amount).sum +
      inbound_transfer_transactions.pluck(:amount).sum
  end
end
