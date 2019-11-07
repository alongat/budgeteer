# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/smarter_csv/all/smarter_csv.rbi
#
# smarter_csv-1.2.6
module SmarterCSV
  def self.guess_line_ending(filehandle, options); end
  def self.only_or_except_limit_execution(options, option_name, key); end
  def self.process(input, options = nil, &block); end
end
class Hash
  def self.from_trusted_xml(xml); end
end
class SmarterCSV::SmarterCSVException < StandardError
end
class SmarterCSV::HeaderSizeMismatch < SmarterCSV::SmarterCSVException
end
class SmarterCSV::IncorrectOption < SmarterCSV::SmarterCSVException
end
class SmarterCSV::DuplicateHeaders < SmarterCSV::SmarterCSVException
end
class SmarterCSV::MissingHeaders < SmarterCSV::SmarterCSVException
end
