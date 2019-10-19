# frozen_string_literal: true

# typed: true

module Parsers
  class ExcelParser
    extend T::Sig
    @flip_amount = true

    sig {params(excel_file: Roo::Excelx).returns(T::Array[T.nilable(T::Array[String])])}
    def self.parse(excel_file)
      sheet = excel_file.sheet(0)
      num_of_rows = sheet.last_row
      calculated_date = date(sheet) unless @date_column.present?
      csv_lines = (@start_row..num_of_rows).map do |row|
        sheet_row = sheet.row(row)
        amount = sheet_row[@amount_column].to_s.gsub(/,|₪|\s/, '').to_f
        date = calculated_date || sheet_row[@date_column].to_s
        amount = -amount if @flip_amount
        next if amount.zero?

        [date.to_s, clean_name(sheet_row[@name_column].to_s), amount.to_s]
      end

      csv_lines
    end

    def self.clean_name(name)
      name.gsub(/'|"|,/, '')
    end
  end
end
