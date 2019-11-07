# typed: true
class CreateMtransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :mtransactions do |t|
      t.datetime :date, null: false
      t.float :amount, null: false
      t.string :note

      t.timestamps
    end

    add_reference :mtransactions, :account, foreign_key: true
  end
end
