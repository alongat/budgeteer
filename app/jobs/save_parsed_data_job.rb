# frozen_string_literal: true
# typed: true

class SaveParsedDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    TransactionFile.where(saved: false, parsed: true).find_each do |tf|
      account = Account.find_or_create_by(name: tf.source)

      # TODO: need to add? options = { :key_mapping => {:unwanted_row => nil, :old_row_name => :new_name}}
      ActiveRecord::Base.transaction do
        tf.file.open do |file|
          SmarterCSV.process(file) do |row|
            puts row
            location_name = row.first.delete(:location).force_encoding('UTF-8')
            location_name = StringsHelper.fix_string_direction(location_name)
            tl = Location.find_or_create_by!(name: location_name)

            # TODO: should create transfer transactions
            account.mtransactions.create!(row.first.merge(location_id: tl.id))
          end
        end
      end

      tf.update!(saved: true)
    end
  end
end
