# typed: true
class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_reference :mtransactions, :location, foreign_key: true
  end
end
