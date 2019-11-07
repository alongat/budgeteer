# typed: true
class CreateCategoriesTransactionLocationsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :categories, :locations do |t|
      t.index :category_id
      t.index :locations_id
    end
  end
end
