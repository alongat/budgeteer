namespace :env_generators do
  desc "Generate example env and load default categories"
  task generate_new_env_example: :environment do
    # Create base accounts
    ['Bank Discount', 'MAX Credit Card',
     'CAL Credit Card', 'Savings'].each { |x|
      Account.find_or_create_by!(name: x)
    }

    # Load base categories and locations
    ActiveRecord::Base.transaction do
      SmarterCSV.process('./places-to-categories-map.csv') do |row|
        location_name = StringsHelper.fix_string_direction(row[0][:location])
        category_name = StringsHelper.fix_string_direction(row[0][:category])
        next if location_name.blank? || category_name.blank?

        c = Category.find_or_create_by!(name: category_name)
        l = Location.find_or_create_by!(name: location_name)
        l.categories << c
      end
    end
  end
end
