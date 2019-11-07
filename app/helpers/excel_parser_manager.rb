# frozen_string_literal: true

# typed: true

# TODO: check why parsers are not loaded eagerly
Dir[File.join(__dir__, 'parsers', '*.rb')].each { |file| require file }

class ExcelParserManager
  extend T::Sig
  PARSERS = Parsers::ExcelParser.descendants

  sig { params(in_dir: String, out_dir: String).void }
  def self.parse_directory(in_dir, out_dir=Rails.root.join('tmp'))
    Dir.foreach(in_dir) do |filename|
      next unless filename.include?('.xls')

      CSV.open(build_csv_filename(out_dir, filename), 'w', encoding: 'utf-8') do |csv|
        create_csvs_from_xls(in_dir + '/' + filename, csv)
      end
    end
  end

  sig { params(file: String).returns(CSV) }
  def self.parse_file(file)
    output_file = CSV.open(build_csv_filename(Rails.root.join('tmp'), file), mode: 'w', encoding: 'utf-8')
    create_csvs_from_xls(file, output_file)

    output_file
  end

  sig { params(file_location: String, csv: CSV).void }
  def self.create_csvs_from_xls(file_location, csv)
    raise 'No parsers found' if PARSERS.blank?

    Rails.logger.info "Reading #{file_location}"
    xlsx = Roo::Spreadsheet.open(file_location)
    sheet = xlsx.sheet(0)
    parser = PARSERS.find { |p| p.can_parse?(sheet) }
    if parser.nil?
      Rails.logger.info 'Found no parsers...'
      return
    end

    Rails.logger.info "Parsing file using #{parser.name}"
    csv << 'date, place, amount' # TODO: do it natively with CSV/SmartCSV
    csv_parsed_lines = parser.parse(xlsx)
    csv_parsed_lines.each { |l| csv << l }
  end

  sig { params(out_dir: String, file: String).returns(String) }
  def self.build_csv_filename(out_dir, file)
    out_dir + '/' + file.sub('.xlsx', '.csv')
  end
end
