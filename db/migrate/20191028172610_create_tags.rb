# typed: true
class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false

      t.timestamps
    end

    Tag.create!(name: '_UNKNOWN_')
  end
end
