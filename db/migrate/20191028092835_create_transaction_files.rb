# typed: true
class CreateTransactionFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_files do |t|
      t.string :filename, null: false
      t.string :source, null: false
      t.boolean :saved, default: false, null: false

      t.timestamps
    end
  end
end
