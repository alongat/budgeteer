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

  sig { params(file_to_parse: ActiveStorage::Attached::One).returns(String) }
  def self.parse_file(file_to_parse)
    output_file_path = build_csv_filename(Rails.root.join('tmp').to_s, "#{SecureRandom.hex(32)}.csv")
    output_file = CSV.open(output_file_path, 'w', encoding: 'utf-8')
    create_csvs_from_xls(file_to_parse, output_file)
    output_file.close

    output_file_path
  end

  sig { params(file_to_parse: ActiveStorage::Attached::One, csv: CSV).void }
  def self.create_csvs_from_xls(file_to_parse, csv)
    raise 'No parsers found' if PARSERS.blank?

    Rails.logger.info "Reading #{file_to_parse}"
    xlsx = Roo::Spreadsheet.open(file_to_parse)
    sheet = xlsx.sheet(0)
    parser = PARSERS.find { |p| p.can_parse?(sheet) }
    if parser.nil?
      Rails.logger.info 'Found no parsers...'
      return
    end

    Rails.logger.info "Parsing file using #{parser.name}"
    csv << %w(date location amount) # TODO: do it natively with CSV/SmartCSV
    csv_parsed_lines = parser.parse(xlsx)
    csv_parsed_lines.each { |l| csv << l }
  end

  sig { params(out_dir: String, file: String).returns(String) }
  def self.build_csv_filename(out_dir, file)
    out_dir + '/' + file.sub('.xlsx', '.csv')
  end
end
