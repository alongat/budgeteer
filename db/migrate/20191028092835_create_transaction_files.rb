# typed: true
class CreateTransactionFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_files do |t|
      t.string :filename, null: false
      t.string :source, null: false
      t.boolean :saved, default: false, null: false

      t.timestamps
    end

    add_reference :transaction_files, :account, foreign_key: true
  end
end
