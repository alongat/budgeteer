class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.datetime :date, null: false
      t.float :amount, null: false
      t.string :place, null: false
      t.string :note
      t.timestamps
    end

    add_reference :transactions, :account, foreign_key: true
  end
end
