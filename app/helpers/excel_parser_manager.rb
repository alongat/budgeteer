# frozen_string_literal: true
# typed: true

#TODO: check why parsers are not loaded eagerly
Dir[File.join(__dir__, 'parsers', '*.rb')].each { |file| require file }

class ExcelParserManager
  extend T::Sig
  PARSERS = Parsers::ExcelParser.descendants

  sig {params(in_dir: String, out_dir: String).returns(T::Boolean)}
  def self.do_the_trick(in_dir, out_dir)
    Dir.foreach(in_dir) do |filename|
      next unless filename.include?('.xls')
      CSV.open(build_csv_filename(out_dir, filename), 'w', encoding: 'utf-8') do |csv|
        create_csvs_from_xls(in_dir + '/' + filename, csv)
      end
    end

    true
  end

  sig {params(excel_to_parse: String, csv: T.untyped).returns(T::Boolean)}
  def self.create_csvs_from_xls(excel_to_parse, csv)
    raise 'No parsers found' if PARSERS.blank?

    Rails.logger.info "Reading #{excel_to_parse}"
    xlsx = Roo::Spreadsheet.open(excel_to_parse)
    sheet = xlsx.sheet(0)
    parser = PARSERS.find { |p| p.can_parse?(sheet) }
    if parser.nil?
      Rails.logger.info "Found no parsers..."
      return false
    end 
    
    Rails.logger.info "Parsing file using #{parser.name}"

    csv_parsed_lines = parser.parse(xlsx)
    csv_parsed_lines.each { |l| csv << l }

    true
  end

  def self.build_csv_filename(out_dir, file)
    out_dir + '/' + file.sub('.xlsx', '.csv')
  end
end
