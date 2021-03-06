# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/roo/all/roo.rbi
#
# roo-2.8.2
module Roo
  def self.const_missing(const_name); end
end
class Roo::Error < StandardError
end
class Roo::HeaderRowNotFoundError < Roo::Error
end
class Roo::FileNotFound < Roo::Error
end
class Roo::Spreadsheet
  def self.extension_for(path, options); end
  def self.open(path, options = nil); end
end
module Roo::Utils
  def char_index(byte); end
  def coordinates_in_range(str); end
  def each_element(path, elements); end
  def extract_coordinate(s); end
  def letter_to_number(letters); end
  def load_xml(path); end
  def num_cells_in_range(str); end
  def num_index(byte); end
  def number_to_letter(num); end
  def ref_to_key(s); end
  def split_coord(str); end
  def split_coordinate(str); end
  extend Roo::Utils
end
module Roo::Formatters
end
module Roo::Formatters::Base
  def integer_to_timestring(content); end
end
module Roo::Formatters::CSV
  def cell_to_csv(row, col, sheet); end
  def to_csv(filename = nil, separator = nil, sheet = nil); end
  def write_csv_content(file = nil, sheet = nil, separator = nil); end
end
module Roo::Formatters::Matrix
  def to_matrix(from_row = nil, from_column = nil, to_row = nil, to_column = nil, sheet = nil); end
end
module Roo::Formatters::XML
  def to_xml; end
end
module Roo::Formatters::YAML
  def to_yaml(prefix = nil, from_row = nil, from_column = nil, to_row = nil, to_column = nil, sheet = nil); end
end
class Roo::Base
  def cell_type_by_value(value); end
  def clean_sheet(sheet); end
  def clean_sheet_if_need(options); end
  def close; end
  def collect_last_row_col_for_sheet(sheet); end
  def column(column_number, sheet = nil); end
  def default_sheet; end
  def default_sheet=(sheet); end
  def download_uri(uri, tmpdir); end
  def each(options = nil); end
  def each_with_pagename; end
  def empty?(row, col, sheet = nil); end
  def file_type_check(filename, exts, name, warning_level, packed = nil); end
  def file_type_warning_message(filename, exts); end
  def find(*args); end
  def find_basename(filename); end
  def find_by_conditions(options); end
  def find_by_row(row_index); end
  def first_column(sheet = nil); end
  def first_column_as_letter(sheet = nil); end
  def first_last_row_col_for_sheet(sheet); end
  def first_row(sheet = nil); end
  def header_index(query); end
  def header_line; end
  def header_line=(arg0); end
  def headers; end
  def info; end
  def initialize(filename, options = nil, _file_warning = nil, _tmpdir = nil); end
  def inspect; end
  def is_stream?(filename_or_stream); end
  def key_to_num(str); end
  def key_to_string(arr); end
  def last_column(sheet = nil); end
  def last_column_as_letter(sheet = nil); end
  def last_row(sheet = nil); end
  def local_filename(filename, tmpdir, packed); end
  def make_tmpdir(prefix = nil, root = nil, &block); end
  def method_missing(m, *args); end
  def normalize(row, col); end
  def open_from_stream(stream, tmpdir); end
  def parse(options = nil); end
  def process_zipfile_packed(zip, tmpdir, path = nil); end
  def reinitialize; end
  def reload; end
  def row(row_number, sheet = nil); end
  def row_with(query, return_headers = nil); end
  def sanitize_value(v); end
  def search_or_set_header(options); end
  def self.TEMP_PREFIX; end
  def self.finalize(object_id); end
  def set(row, col, value, sheet = nil); end
  def set_headers(hash = nil); end
  def set_type(row, col, type, sheet = nil); end
  def set_value(row, col, value, sheet = nil); end
  def sheet(index, name = nil); end
  def unzip(filename, tmpdir); end
  def uri?(filename); end
  def validate_sheet!(sheet); end
  def without_changing_default_sheet; end
  include Enumerable
  include Roo::Formatters::Base
  include Roo::Formatters::CSV
  include Roo::Formatters::Matrix
  include Roo::Formatters::XML
  include Roo::Formatters::YAML
end
class Roo::Font
  def bold; end
  def bold=(arg0); end
  def bold?; end
  def italic; end
  def italic=(arg0); end
  def italic?; end
  def underline; end
  def underline=(arg0); end
  def underline?; end
end
module Roo::Tempdir
  def finalize_tempdirs(object_id); end
  def make_tempdir(object, prefix, root); end
end
class Roo::OpenOffice < Roo::Base
  def attribute(node, attr_name); end
  def cell(row, col, sheet = nil); end
  def celltype(row, col, sheet = nil); end
  def children_to_string(children); end
  def comment(row, col, sheet = nil); end
  def comments(sheet = nil); end
  def decrypt(content_entry, cipher); end
  def decrypt_if_necessary(zip_file, content_entry, roo_content_xml_path, options); end
  def doc; end
  def find_cipher(*args); end
  def find_cipher_key(*args); end
  def font(row, col, sheet = nil); end
  def formula(row, col, sheet = nil); end
  def formula?(*args); end
  def formulas(sheet = nil); end
  def initialize(filename, options = nil); end
  def initialize_default_variables; end
  def label(labelname); end
  def labels(_sheet = nil); end
  def method_missing(m, *args); end
  def officeversion; end
  def oo_version; end
  def open_oo_file(options); end
  def perform_decryption(encryption_data, password, content_entry, roo_content_xml_path); end
  def read_cells(sheet = nil); end
  def read_comments(sheet = nil); end
  def read_labels; end
  def read_styles(style_elements); end
  def read_table_styles(styles); end
  def set_cell_values(sheet, x, y, i, v, value_type, formula, table_cell, str_v, style_name); end
  def sheets; end
  def to_s(sheet = nil); end
  extend Roo::Tempdir
end
class Roo::Link < String
  def href; end
  def initialize(href = nil, text = nil); end
  def to_uri; end
  def url; end
end
class Roo::Excelx < Roo::Base
  def cell(row, col, sheet = nil); end
  def celltype(row, col, sheet = nil); end
  def clean_sheet(sheet); end
  def column(column_number, sheet = nil); end
  def comment(row, col, sheet = nil); end
  def comment?(row, col, sheet = nil); end
  def comments(sheet = nil); end
  def comments_files(*args, &block); end
  def each_row_streaming(options = nil); end
  def empty?(row, col, sheet = nil); end
  def excelx_format(row, col, sheet = nil); end
  def excelx_type(row, col, sheet = nil); end
  def excelx_value(row, col, sheet = nil); end
  def extract_images(entries, tmpdir); end
  def extract_sheets_in_order(entries, sheet_ids, sheets, tmpdir); end
  def extract_worksheet_ids(entries, path); end
  def extract_worksheet_rels(entries, path); end
  def first_column(sheet = nil); end
  def first_row(sheet = nil); end
  def font(row, col, sheet = nil); end
  def formatted_value(row, col, sheet = nil); end
  def formula(row, col, sheet = nil); end
  def formula?(*args); end
  def formulas(sheet = nil); end
  def hyperlink(row, col, sheet = nil); end
  def hyperlink?(row, col, sheet = nil); end
  def image_files(*args, &block); end
  def image_rels(*args, &block); end
  def images(sheet = nil); end
  def initialize(filename_or_stream, options = nil); end
  def label(name); end
  def labels; end
  def last_column(sheet = nil); end
  def last_row(sheet = nil); end
  def method_missing(method, *args); end
  def process_zipfile(zipfilename_or_stream); end
  def process_zipfile_entries(entries); end
  def rels_files(*args, &block); end
  def row(rownumber, sheet = nil); end
  def safe_send(object, method, *args); end
  def set(row, col, value, sheet = nil); end
  def shared_strings(*args, &block); end
  def sheet_files(*args, &block); end
  def sheet_for(sheet); end
  def sheets; end
  def styles(*args, &block); end
  def to_s(sheet = nil); end
  def workbook(*args, &block); end
  def worksheet_types; end
  extend Forwardable
  extend Roo::Tempdir
end
class Roo::Excelx::Shared
  def base_date; end
  def base_timestamp; end
  def comments_files; end
  def comments_files=(arg0); end
  def image_files; end
  def image_files=(arg0); end
  def image_rels; end
  def image_rels=(arg0); end
  def initialize(dir, options = nil); end
  def rels_files; end
  def rels_files=(arg0); end
  def shared_strings; end
  def sheet_files; end
  def sheet_files=(arg0); end
  def styles; end
  def workbook; end
end
module Roo::Helpers
end
module Roo::Helpers::WeakInstanceCache
  def instance_cache(key); end
  def instance_cache_finalizer(key); end
end
class Roo::Excelx::Extractor
  def doc; end
  def doc_exists?; end
  def initialize(path, options = nil); end
  include Roo::Helpers::WeakInstanceCache
end
class Roo::Excelx::Workbook < Roo::Excelx::Extractor
  def base_date; end
  def base_timestamp; end
  def defined_names; end
  def initialize(path); end
  def sheets; end
end
class Roo::Excelx::Workbook::Label
  def col; end
  def initialize(name, sheet, row, col); end
  def key; end
  def name; end
  def row; end
  def sheet; end
end
class Roo::Excelx::SharedStrings < Roo::Excelx::Extractor
  def [](index); end
  def create_html(text, formatting); end
  def extract_html; end
  def extract_html_r(r_elem); end
  def extract_shared_strings; end
  def fix_invalid_shared_strings(doc); end
  def to_a; end
  def to_html; end
  def use_html?(index); end
end
class Roo::Excelx::Styles < Roo::Excelx::Extractor
  def definitions; end
  def extract_definitions; end
  def extract_fonts; end
  def extract_num_fmt_ids; end
  def extract_num_fmts; end
  def fonts; end
  def num_fmt_ids; end
  def num_fmts; end
  def style_format(style); end
end
module Roo::Helpers::DefaultAttrReader
  def attr_reader_with_default(attr_hash); end
end
class Roo::Excelx::Cell
  def coordinate; end
  def create_date(date); end
  def create_datetime(date); end
  def excelx_type; end
  def excelx_value; end
  def formula; end
  def hyperlink; end
  def initialize(value, type, formula, excelx_type, excelx_value, style, hyperlink, base_date, coordinate); end
  def round_datetime(datetime_string); end
  def self.cell_class(type); end
  def self.create_cell(type, *values); end
  def style; end
  def type; end
  def type_cast_value(value); end
  def value; end
  def value=(arg0); end
end
class Roo::Excelx::Cell::Base
  def cell_type; end
  def cell_value; end
  def default_type; end
  def empty?; end
  def excelx_type; end
  def excelx_value; end
  def formatted_value; end
  def formula?; end
  def hyperlink; end
  def initialize(value, formula, excelx_type, style, link, coordinate); end
  def link; end
  def link?; end
  def presence; end
  def style; end
  def to_s; end
  def type; end
  def value; end
  def value=(arg0); end
  extend Roo::Helpers::DefaultAttrReader
end
class Roo::Excelx::Cell::Boolean < Roo::Excelx::Cell::Base
  def cell_type; end
  def cell_value; end
  def coordinate; end
  def create_boolean(value); end
  def default_type; end
  def format; end
  def formatted_value; end
  def formula; end
  def initialize(value, formula, style, link, coordinate); end
  def value; end
end
class Roo::Excelx::Cell::DateTime < Roo::Excelx::Cell::Base
  def cell_value; end
  def coordinate; end
  def create_datetime(base_timestamp, value); end
  def default_type; end
  def format; end
  def formatted_value; end
  def formula; end
  def initialize(value, formula, excelx_type, style, link, base_timestamp, coordinate); end
  def parse_date_or_time_format(part); end
  def value; end
end
class Roo::Excelx::Cell::Date < Roo::Excelx::Cell::DateTime
  def cell_type; end
  def cell_value; end
  def coordinate; end
  def create_date(base_date, value); end
  def create_datetime(_, _); end
  def default_type; end
  def format; end
  def formula; end
  def initialize(value, formula, excelx_type, style, link, base_date, coordinate); end
  def value; end
end
class Roo::Excelx::Cell::Empty < Roo::Excelx::Cell::Base
  def cell_type; end
  def cell_value; end
  def coordinate; end
  def default_type; end
  def empty?; end
  def format; end
  def formula; end
  def initialize(coordinate); end
  def style; end
  def value; end
end
class Roo::Excelx::Cell::Number < Roo::Excelx::Cell::Base
  def cell_value; end
  def coordinate; end
  def create_numeric(number); end
  def default_type; end
  def format; end
  def formatted_value; end
  def formula; end
  def generate_formatter(format); end
  def initialize(value, formula, excelx_type, style, link, coordinate); end
  def number_format(formatter, negative_formatter = nil); end
  def value; end
end
class Roo::Excelx::Cell::String < Roo::Excelx::Cell::Base
  def cell_type; end
  def cell_value; end
  def coordinate; end
  def default_type; end
  def empty?; end
  def format; end
  def formula; end
  def initialize(value, formula, style, link, coordinate); end
  def value; end
end
class Roo::Excelx::Cell::Time < Roo::Excelx::Cell::DateTime
  def cell_value; end
  def coordinate; end
  def default_type; end
  def format; end
  def formatted_value; end
  def formula; end
  def initialize(value, formula, excelx_type, style, link, base_date, coordinate); end
  def to_s; end
  def value; end
end
class Roo::Excelx::Cell::Coordinate
  def column; end
  def column=(arg0); end
  def initialize(row, column); end
  def row; end
  def row=(arg0); end
end
class Roo::Excelx::Sheet
  def cells; end
  def cells_for_row_element(row_element, options = nil); end
  def column(col_number); end
  def comments; end
  def comments_files(*args, &block); end
  def dimensions; end
  def each_row(options = nil, &block); end
  def excelx_format(key); end
  def first_column; end
  def first_last_row_col; end
  def first_row; end
  def hyperlinks; end
  def image_rels(*args, &block); end
  def images; end
  def initialize(name, shared, sheet_index, options = nil); end
  def last_column; end
  def last_row; end
  def pad_cells(cell, last_column); end
  def present_cells; end
  def rels_files(*args, &block); end
  def row(row_number); end
  def shared_strings(*args, &block); end
  def sheet_files(*args, &block); end
  def styles(*args, &block); end
  def workbook(*args, &block); end
  extend Forwardable
end
class Roo::Excelx::Relationships < Roo::Excelx::Extractor
  def [](index); end
  def extract_relationships; end
  def include_type?(type); end
  def to_a; end
end
class Roo::Excelx::Comments < Roo::Excelx::Extractor
  def comments; end
  def extract_comments; end
end
class Roo::Excelx::SheetDoc < Roo::Excelx::Extractor
  def base_date; end
  def base_timestamp; end
  def cell_from_xml(cell_xml, hyperlink, coordinate, empty_cell = nil); end
  def cell_value_type(type, format); end
  def cells(relationships); end
  def create_cell_from_value(value_type, cell, formula, format, style, hyperlink, coordinate); end
  def create_empty_cell(coordinate, empty_cell); end
  def dimensions; end
  def each_cell(row_xml); end
  def each_row_streaming(&block); end
  def expand_merged_ranges(cells); end
  def extract_cells(relationships); end
  def extract_dimensions; end
  def extract_hyperlinks(relationships); end
  def hyperlinks(relationships); end
  def initialize(path, relationships, shared, options = nil); end
  def shared_strings; end
  def style_format(style); end
  def workbook(*args, &block); end
  extend Forwardable
end
class Roo::Excelx::Coordinate < Array
  def column; end
  def initialize(row, column); end
  def row; end
end
module Roo::Excelx::Format
  def _to_type(format); end
  def to_type(format); end
  extend Roo::Excelx::Format
end
class Roo::Excelx::Images < Roo::Excelx::Extractor
  def extract_images_names; end
  def list; end
end
class Roo::Excelx::ExceedsMaxError < StandardError
end
class Roo::CSV < Roo::Base
  def cell(row, col, sheet = nil); end
  def cell_postprocessing(_row, _col, value); end
  def celltype(row, col, sheet = nil); end
  def celltype_class(value); end
  def clean_sheet(sheet); end
  def csv_options; end
  def each_row(options, &block); end
  def each_row_using_tempdir(options, &block); end
  def filename; end
  def filename_or_stream; end
  def read_cells(sheet = nil); end
  def set_column_count(sheet, last_col); end
  def set_row_count(sheet, last_row); end
  def set_type(row, col, type, _sheet); end
  def set_value(row, col, value, _sheet); end
  def sheets; end
end
