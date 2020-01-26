# typed: true
class CreateTransferTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transfer_transactions do |t|
      t.datetime :date, null: false
      t.float :amount, null: false
      t.string :note

      t.timestamps
    end

    add_column :transfer_transactions, :from_account_id, :integer, default: 0, null: false
    add_index :transfer_transactions, :from_account_id

    add_column :transfer_transactions, :to_account_id, :integer, default: 0, null: false
    add_index :transfer_transactions, :to_account_id
  end
end
