# typed: true
class CreateCategoriesMtransactionsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :categories, :mtransactions do |t|
      t.index :category_id
      t.index :mtransactions_id
    end
  end
end
