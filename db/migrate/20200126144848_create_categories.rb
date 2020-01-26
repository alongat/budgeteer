# typed: true
class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.integer :type

      t.timestamps
    end

    add_reference :tags, :category, foreign_key: true, index: true
  end
end
