# frozen_string_literal: true
# typed: false

class ParseIncomingDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ap args
    incoming_file_location = args[0][:file_location]
    file_source = args[0][:source]

    parsed_file = ExcelParserManager.parse_file(incoming_file_location)

    tf = TransactionFile.create!(filename: incoming_file_location, source: file_source)
    tf.attach(io: parsed_file, filename: "#{file_source.downcase}_#{incoming_file_location.downcase}.csv")
  end
end
