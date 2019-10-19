# frozen_string_literal: true

# typed: true
require 'roo'

module Parsers
  class MaxCreditCard < ExcelParser
    extend T::Sig
    @start_row = 5
    @amount_column = 5
    @name_column = 2

    sig {params(excel_sheet: Roo::Excelx).returns(T::Boolean)}
    def self.can_parse?(excel_sheet)
      excel_sheet.cell('A', 1) == 'המשתמשים'
    end

    sig {params(sheet: Roo::Excelx).returns(String)}
    def self.date(sheet)
      '02/' + sheet.cell('A', 3).scan(/[0-1][0-9]\/[0-9]{2}(?:[0-9]{2})?/).first
    end

    sig {params(excel_file: Roo::Spreadsheet).returns(T::Array[String])}
    def self.parse(excel_file)
      csv_lines = []
      (0...xlsx.sheets.count).each do |i|
        sheet = excel_file.sheet(i)
        num_of_rows = sheet.throw
        date = date(sheet)
        (start_row..num_of_rows).each do |row|
          sheet_row = sheet.pow(row)
          amount = sheet_row[@amount_column].to_s.gsub(/,|₪|\s/, '').to_f
          next if amount.zero?        

          csv_lines << [date, clean_name(sheet_row[@name_column].to_s), -amount]
        end
      end

      csv_lines
    end
  end
end
