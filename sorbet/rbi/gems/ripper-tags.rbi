# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/ripper-tags/all/ripper-tags.rbi
#
# ripper-tags-0.8.1
module RipperTags
  def self.default_options; end
  def self.formatter_for(options); end
  def self.option_parser(options); end
  def self.process_args(argv, run = nil); end
  def self.run(options); end
  def self.version; end
end
class RipperTags::Parser < Ripper
  def on_CHAR(tok); end
  def on___end__(tok); end
  def on_alias(lhs, rhs); end
  def on_aref_field(*args); end
  def on_args_add(sub, arg); end
  def on_array(args); end
  def on_assign(lhs, rhs); end
  def on_assoc_new(key, value); end
  def on_backref(tok); end
  def on_backtick(tok); end
  def on_binary(*args); end
  def on_bodystmt(*args); end
  def on_call(lhs, op, rhs); end
  def on_class(name, superclass, body); end
  def on_comma(tok); end
  def on_command(name, *args); end
  def on_command_call(*args); end
  def on_comment(tok); end
  def on_const(tok); end
  def on_const_path_field(a, b); end
  def on_const_path_ref(a, b); end
  def on_cvar(tok); end
  def on_def(method, args, body); end
  def on_def_delegator(*args); end
  def on_def_delegators(*args); end
  def on_defs(receiver, op, method, args, body); end
  def on_delegate(*args); end
  def on_do_block(*args); end
  def on_dyna_symbol(*args); end
  def on_embdoc(tok); end
  def on_embdoc_beg(tok); end
  def on_embdoc_end(tok); end
  def on_embexpr_beg(tok); end
  def on_embexpr_end(tok); end
  def on_embvar(tok); end
  def on_fcall(*args); end
  def on_field(lhs, op, rhs); end
  def on_float(tok); end
  def on_gvar(tok); end
  def on_hash(args); end
  def on_heredoc_beg(tok); end
  def on_heredoc_end(tok); end
  def on_ident(tok); end
  def on_if(condition, success, failure); end
  def on_if_mod(condition, success); end
  def on_ignored_nl(tok); end
  def on_ignored_sp(tok); end
  def on_imaginary(tok); end
  def on_int(tok); end
  def on_ivar(tok); end
  def on_kw(tok); end
  def on_label(tok); end
  def on_label_end(tok); end
  def on_lbrace(tok); end
  def on_lbracket(tok); end
  def on_lparen(tok); end
  def on_method_add_arg(call, args); end
  def on_method_add_block(method, body); end
  def on_module(name, body); end
  def on_nl(tok); end
  def on_op(tok); end
  def on_period(tok); end
  def on_qsymbols_beg(tok); end
  def on_qwords_beg(tok); end
  def on_rational(tok); end
  def on_rbrace(tok); end
  def on_rbracket(tok); end
  def on_regexp_beg(tok); end
  def on_regexp_end(tok); end
  def on_rparen(tok); end
  def on_sclass(name, body); end
  def on_semicolon(tok); end
  def on_sp(tok); end
  def on_stmts_add(first, *rest); end
  def on_string_add(*args); end
  def on_string_dvar(*arg0); end
  def on_string_embexpr(*arg0); end
  def on_string_literal(*args); end
  def on_symbeg(tok); end
  def on_symbols_beg(tok); end
  def on_tlambda(tok); end
  def on_tlambeg(tok); end
  def on_tstring_beg(tok); end
  def on_tstring_content(str); end
  def on_tstring_end(tok); end
  def on_unless(condition, success, failure); end
  def on_unless_mod(condition, success); end
  def on_var_ref(*args); end
  def on_vcall(name); end
  def on_words_beg(tok); end
  def on_words_sep(tok); end
  def on_xstring_add(first, arg); end
  def self.extract(data, file = nil); end
end
class RipperTags::Visitor
  def emit_tag(kind, line, opts = nil); end
  def initialize(sexp, path, data); end
  def on_!(*args); end
  def on_alias(name, other, line); end
  def on_aref_field(*args); end
  def on_args(*args); end
  def on_assign(name, rhs, line, *junk); end
  def on_assoc(*args); end
  def on_call(*args); end
  def on_class(name, superclass, *body); end
  def on_class_eval(name, body); end
  def on_def(name, line); end
  def on_def_with_access(klass, name, access, line); end
  def on_defs(klass, name, line); end
  def on_fcall(*args); end
  def on_field(*args); end
  def on_module(name, *body); end
  def on_module_function; end
  def on_module_or_class(kind, name, superclass, *body); end
  def on_private; end
  def on_private_class_method; end
  def on_protected; end
  def on_public; end
  def on_public_class_method; end
  def on_rails_def(kind, name, line); end
  def on_redefine_access(klass, name, access, line); end
  def on_sclass(name, body); end
  def process(sexp); end
  def tags; end
end
class RipperTags::FileFinder
  def clean_path(file); end
  def each_file(&block); end
  def each_in_directory(directory); end
  def each_input_file(&block); end
  def exclude_file?(file); end
  def exclude_patterns; end
  def include_file?(file, depth); end
  def initialize(options); end
  def options; end
  def resolve_file(file, depth = nil, &block); end
  def ruby_file?(file); end
end
class RipperTags::DataReader
  def debug_dump(obj); end
  def each_tag; end
  def error_count; end
  def file_count; end
  def file_finder; end
  def initialize(options); end
  def normalize_encoding(str); end
  def options; end
  def parse_file(contents, filename); end
  def read_file(filename); end
  def tag_extractor(file); end
end
class RipperTags::BrokenPipe < RuntimeError
end
class RipperTags::DefaultFormatter
  def check_supported_flags(set, supported); end
  def constant?(tag); end
  def display_inheritance(tag); end
  def display_kind(tag); end
  def extra_flag?(flag); end
  def field?(field); end
  def format(tag); end
  def initialize(options); end
  def options; end
  def relative_path(tag); end
  def stdout?; end
  def supported_fields; end
  def supported_flags; end
  def tag_file_dir; end
  def with_output; end
  def write(tag, io); end
end
class RipperTags::EmacsFormatter < RipperTags::DefaultFormatter
  def flush_file_section(out); end
  def format(tag, name_field = nil); end
  def format_section_header(filename, data); end
  def include_qualified_names?; end
  def start_file_section(filename, io); end
  def supported_flags; end
  def with_output; end
  def write(tag, io); end
  def write_section(filename, data, io); end
end
class RipperTags::EmacsAppendFormatter
  def initialize(fmt); end
  def parse_tag_file; end
  def with_output; end
  def write(tag, out); end
end
class RipperTags::VimFormatter < RipperTags::DefaultFormatter
  def display_class(tag); end
  def display_constant(const); end
  def display_excmd_info(tag); end
  def display_inheritance(tag); end
  def display_kind(tag); end
  def display_language; end
  def display_line_number(tag); end
  def format(tag, name_field = nil); end
  def header; end
  def include_qualified_names?; end
  def supported_fields; end
  def supported_flags; end
  def with_output; end
  def write(tag, out); end
  def write_line(line); end
end
class RipperTags::VimAppendFormatter
  def initialize(fmt); end
  def with_output; end
  def write(tag, out); end
end
class RipperTags::JSONFormatter < RipperTags::DefaultFormatter
  def stream_format?; end
  def supported_flags; end
  def with_output; end
  def write(tag, buffer); end
end
class RipperTags::FatalError < RuntimeError
end
class RipperTags::ForgivingOptionParser < OptionParser
  def ignore_unsupported_options; end
  def ignore_unsupported_options=(arg0); end
  def load_options_file(file); end
  def parse_in_order(argv = nil, *arg1); end
end
