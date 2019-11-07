# frozen_string_literal: true
# typed: true

class SaveParsedDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    TransactionFile.where(saved: false).find_each do |tf|
      account = Account.find_or_create_by(name: tf.source)

      # TODO: need to add? options = { :key_mapping => {:unwanted_row => nil, :old_row_name => :new_name}}
      tf.file.open do |file|
         SmarterCSV.process(file) do |row|
           location_name = row.first.delete(:location).force_encoding('UTF-8')
           tl = Location.find_or_create_by!(name: location_name)
           account.mtransactions.create!(row.first.merge(location_id: tl.id))
        end
      end
    end
  end
end
