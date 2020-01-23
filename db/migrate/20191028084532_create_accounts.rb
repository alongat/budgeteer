# typed: true
class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.float :base_amount, null: false, default: 0
      t.timestamps
    end
  end
end
