# frozen_string_literal: true

# typed: true
require 'roo'

module Parsers
  class VisaCalCreditCard < ExcelParser
    extend T::Sig
    @start_row = 4
    @amount_column = 3
    @name_column = 1

    sig { params(excel_sheet: Roo::Excelx).returns(T::Boolean) }
    def self.can_parse?(excel_sheet)
      excel_sheet.cell('A', 1).include? 'פירוט עסקות נכון לתאריך'
    end

    sig { params(excel_sheet: Roo::Excelx).returns(String) }
    def self.date(excel_sheet)
      '02/' + excel_sheet.cell('A', 2).scan(%r{[0-1][0-9]\/[0-9]{2}(?:[0-9]{2})?}).first
    end
  end
end
