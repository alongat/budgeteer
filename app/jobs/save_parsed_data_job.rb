# frozen_string_literal: true
# typed: true

class SaveParsedDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    TransactionFile.where(saved: false).find_each do |file|
      account = Account.find_by_name(file.source)
      if account.blank?
        Rails.logger.error("Account #{account} not found!")
        next
      end

      # TODO: need to add? options = { :key_mapping => {:unwanted_row => nil, :old_row_name => :new_name}}
      process_count = SmarterCSV.process(file.file.open) do |row|
        account.mtransactions.create!(row.first)
      end
    end
  end
end
