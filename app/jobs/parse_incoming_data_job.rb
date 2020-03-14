# frozen_string_literal: true
# typed: true

class ParseIncomingDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    TransactionFile.where(parsed: false, saved: false).each do |tf|
      # TODO: Parses should handle CSVs 
      parsed_file_path = ExcelParserManager.parse_file(tf.file)
      tf.file.delete
      tf.files.attach(io: File.open(parsed_file_path),
                    filename: "#{file_source.downcase}_#{input_filename.downcase}.csv")
      tf.update!(parsed: true, saved: false)
    end
  end
end
