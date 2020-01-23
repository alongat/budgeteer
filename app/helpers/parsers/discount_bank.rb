# frozen_string_literal: true

# typed: true
require 'roo'

module Parsers
  class DiscountBank < ExcelParser
    extend T::Sig
    @start_row = 13
    @amount_column = 3
    @date_column = 1
    @name_column = 2
    @flip_amount = false

    sig { params(excel_sheet: Roo::Excelx).returns(T::Boolean) }
    def self.can_parse?(excel_sheet)
      excel_sheet.cell('A', 10) == 'תנועות אחרונות'
    end
  end
end
