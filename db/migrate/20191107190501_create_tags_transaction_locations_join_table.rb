# typed: true
class CreateTagsTransactionLocationsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tags, :locations do |t|
      t.index :tag_id
      t.index :locations_id
    end
  end
end
