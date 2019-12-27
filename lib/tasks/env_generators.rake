namespace :env_generators do
  desc "TODO"
  task generate_new_env_example: :environment do
    # Create base accounts
    ['Bank Discount', 'MAX Credit Card', 
     'CAL Credit Card', 'Savings'].each { |x| 
      Account.first_or_create_by!(name: x)
    }

    # Load base categories and locations
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
