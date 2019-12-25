# typed: true
class CreateCategoriesTransactionLocationsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :categories, :locations do |t|
      t.index :category_id
      t.index :locations_id
    end

    SmarterCSV.process('./places-to-categories-map.csv') do |row|
      location_name = StringsHelper.fix_string_direction(row[0][:location])
      category_name = StringsHelper.fix_string_direction(row[0][:category])
      next if location_name.blank? or category_name.blank?
      c = Category.find_or_create_by!(name: category_name)
      l = Location.find_or_create_by!(name: location_name)
      l.categories << c
    end
  end
end
