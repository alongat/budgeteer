# frozen_string_literal: true

# typed: true
require 'roo'

module Parsers
  class DiscountCreditCard < ExcelParser
    extend T::Sig
    @start_row = 17
    @amount_column = 6
    @date_column = 1
    @name_column = 2

    sig { params(excel_sheet: Roo::Excelx).returns(T::Boolean) }
    def self.can_parse?(excel_sheet)
      excel_sheet.cell('A', 1) == 'פירוט עסקאות בכרטיסים'
    end
  end
end
