# frozen_string_literal: true
# typed: true

class ParseIncomingDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    TransactionFile.where(parsed: false).each do |tf|
      # TODO: Parses should handle CSVs 
      parsed_file_path = ExcelParserManager.parse_file(input_filename)
      tf.parsed_file.attach(io: File.open(parsed_file_path),
                    filename: "#{file_source.downcase}_#{input_filename.downcase}.csv")
    end
  end
end
