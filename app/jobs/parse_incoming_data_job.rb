# frozen_string_literal: true
# typed: false

class ParseIncomingDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    input_filename = args[0][:file_location] # TODO take filename
    file_source = args[0][:source]

    parsed_file_path = ExcelParserManager.parse_file(input_filename)

    tf = TransactionFile.create!(filename: input_filename, source: file_source)
    tf.file.attach(io:  File.open(parsed_file_path),
                   filename: "#{file_source.downcase}_#{input_filename.downcase}.csv")
  end
end
