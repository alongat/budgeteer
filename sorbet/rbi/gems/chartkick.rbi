# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/chartkick/all/chartkick.rbi
#
# chartkick-3.3.1
module Chartkick
  def self.content_for; end
  def self.content_for=(arg0); end
  def self.options; end
  def self.options=(arg0); end
end
module Chartkick::Helper
  def area_chart(data_source, **options); end
  def bar_chart(data_source, **options); end
  def chartkick_chart(klass, data_source, **options); end
  def chartkick_deep_merge(hash_a, hash_b); end
  def chartkick_json_escape(s); end
  def column_chart(data_source, **options); end
  def geo_chart(data_source, **options); end
  def line_chart(data_source, **options); end
  def pie_chart(data_source, **options); end
  def scatter_chart(data_source, **options); end
  def timeline(data_source, **options); end
end
class Chartkick::Engine < Rails::Engine
end
module Enumerable
  def chart_json; end
end
