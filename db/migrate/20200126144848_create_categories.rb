# typed: true
class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.integer :name, null: false

      t.timestamps
    end
    add_index :categories, :name, unique: true
    
    Category::DEFAULT_CATEGORIES.values.each { |i|
      Category.find_or_create_by(name: i)
    }

    i = Category.other.first
    
    add_reference :tags, :category, foreign_key: true, index: true, default: i.id
  end
end
