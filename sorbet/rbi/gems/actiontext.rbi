# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: false
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/actiontext/all/actiontext.rbi
#
# actiontext-6.0.2.1
module ActionText
  def self.railtie_helpers_paths; end
  def self.railtie_namespace; end
  def self.railtie_routes_url_helpers(include_path_helpers = nil); end
  def self.table_name_prefix; end
  def self.use_relative_model_naming?; end
  extend ActiveSupport::Autoload
end
module ActionText::Attachables
  extend ActiveSupport::Autoload
end
module ActionText::Attachments
  extend ActiveSupport::Autoload
end
class ActionText::Engine < Rails::Engine
end
module ActionText::Attachments::TrixConversion
  def to_trix_attachment(content = nil); end
  def trix_attachment_content; end
  extend ActiveSupport::Concern
end
module ActionText::Attachments::TrixConversion::ClassMethods
  def fragment_by_converting_trix_attachments(content); end
  def from_trix_attachment(trix_attachment); end
end
module ActionText::Attachments::Minification
  extend ActiveSupport::Concern
end
module ActionText::Attachments::Minification::ClassMethods
  def fragment_by_minifying_attachments(content); end
end
module ActionText::Attachments::Caching
  def cache_digest; end
  def cache_key(*args); end
end
class ActionText::Attachment
  def attachable; end
  def attachable_attributes; end
  def caption; end
  def full_attributes; end
  def initialize(node, attachable); end
  def inspect; end
  def method_missing(method, *args, &block); end
  def node; end
  def node_attributes; end
  def respond_to_missing?(name, include_private = nil); end
  def self.fragment_by_canonicalizing_attachments(content); end
  def self.from_attachable(attachable, attributes = nil); end
  def self.from_attachables(attachables); end
  def self.from_attributes(attributes, attachable = nil); end
  def self.from_node(node, attachable = nil); end
  def self.node_from_attributes(attributes); end
  def self.process_attributes(attributes); end
  def sgid_attributes; end
  def to_html; end
  def to_param(*args, &block); end
  def to_plain_text; end
  def to_s; end
  def with_full_attributes; end
  extend ActionText::Attachments::Minification::ClassMethods
  extend ActionText::Attachments::TrixConversion::ClassMethods
  include ActionText::Attachments::TrixConversion
end
module ActionText::ContentHelper
  def allowed_attributes; end
  def allowed_attributes=(obj); end
  def allowed_tags; end
  def allowed_tags=(obj); end
  def render_action_text_attachments(content); end
  def render_action_text_content(content); end
  def sanitize_action_text_content(content); end
  def sanitizer; end
  def sanitizer=(obj); end
  def scrubber; end
  def scrubber=(obj); end
  def self.allowed_attributes; end
  def self.allowed_attributes=(obj); end
  def self.allowed_tags; end
  def self.allowed_tags=(obj); end
  def self.sanitizer; end
  def self.sanitizer=(obj); end
  def self.scrubber; end
  def self.scrubber=(obj); end
end
module ActionText::TagHelper
  def rich_text_area_tag(name, value = nil, options = nil); end
  def self.id; end
  def self.id=(obj); end
end
module ActionView::Helpers
end
class ActionView::Helpers::Tags::ActionText < ActionView::Helpers::Tags::Base
  def dom_id(*args, &block); end
  def editable_value; end
  def render; end
  include ActionView::Helpers::Tags::Placeholderable
end
module ActionView::Helpers::FormHelper
  def rich_text_area(object_name, method, options = nil); end
end
class ActionView::Helpers::FormBuilder
  def rich_text_area(method, options = nil); end
end
module ActionText::Attribute
  extend ActiveSupport::Concern
end
module ActionText::Attribute::ClassMethods
  def has_rich_text(name); end
end
module ActionText::Serialization
  def _dump(*arg0); end
  extend ActiveSupport::Concern
end
module ActionText::Serialization::ClassMethods
  def _load(content); end
  def dump(content); end
  def load(content); end
end
class ActionText::Content
  def ==(other); end
  def append_attachables(attachables); end
  def as_json(*arg0); end
  def attachables; end
  def attachment_for_node(node, with_full_attributes: nil); end
  def attachment_galleries; end
  def attachment_gallery_for_node(node); end
  def attachment_gallery_nodes; end
  def attachment_nodes; end
  def attachments; end
  def blank?(*args, &block); end
  def empty?(*args, &block); end
  def fragment; end
  def gallery_attachments; end
  def html_safe(*args, &block); end
  def initialize(content = nil, options = nil); end
  def inspect; end
  def links; end
  def present?(*args, &block); end
  def render_attachment_galleries(&block); end
  def render_attachments(**options, &block); end
  def renderer; end
  def renderer=(obj); end
  def self.fragment_by_canonicalizing_content(content); end
  def self.renderer; end
  def self.renderer=(obj); end
  def to_html; end
  def to_plain_text; end
  def to_rendered_html_with_layout; end
  def to_s; end
  def to_trix_html; end
  extend ActionText::Serialization::ClassMethods
  include ActionText::Serialization
end
module ActionText::RichText::GeneratedAttributeMethods
end
class ActionText::RichText < ActiveRecord::Base
  def after_add_for_embeds_attachments; end
  def after_add_for_embeds_attachments=(val); end
  def after_add_for_embeds_attachments?; end
  def after_add_for_embeds_blobs; end
  def after_add_for_embeds_blobs=(val); end
  def after_add_for_embeds_blobs?; end
  def after_remove_for_embeds_attachments; end
  def after_remove_for_embeds_attachments=(val); end
  def after_remove_for_embeds_attachments?; end
  def after_remove_for_embeds_blobs; end
  def after_remove_for_embeds_blobs=(val); end
  def after_remove_for_embeds_blobs?; end
  def autosave_associated_records_for_embeds_attachments(*args); end
  def autosave_associated_records_for_embeds_blobs(*args); end
  def autosave_associated_records_for_record(*args); end
  def before_add_for_embeds_attachments; end
  def before_add_for_embeds_attachments=(val); end
  def before_add_for_embeds_attachments?; end
  def before_add_for_embeds_blobs; end
  def before_add_for_embeds_blobs=(val); end
  def before_add_for_embeds_blobs?; end
  def before_remove_for_embeds_attachments; end
  def before_remove_for_embeds_attachments=(val); end
  def before_remove_for_embeds_attachments?; end
  def before_remove_for_embeds_blobs; end
  def before_remove_for_embeds_blobs=(val); end
  def before_remove_for_embeds_blobs?; end
  def blank?(*args, &block); end
  def empty?(*args, &block); end
  def nil?(*args, &block); end
  def present?(*args, &block); end
  def self.__callbacks; end
  def self._reflections; end
  def self._validators; end
  def self.after_add_for_embeds_attachments; end
  def self.after_add_for_embeds_attachments=(val); end
  def self.after_add_for_embeds_attachments?; end
  def self.after_add_for_embeds_blobs; end
  def self.after_add_for_embeds_blobs=(val); end
  def self.after_add_for_embeds_blobs?; end
  def self.after_remove_for_embeds_attachments; end
  def self.after_remove_for_embeds_attachments=(val); end
  def self.after_remove_for_embeds_attachments?; end
  def self.after_remove_for_embeds_blobs; end
  def self.after_remove_for_embeds_blobs=(val); end
  def self.after_remove_for_embeds_blobs?; end
  def self.attachment_reflections; end
  def self.attribute_type_decorations; end
  def self.before_add_for_embeds_attachments; end
  def self.before_add_for_embeds_attachments=(val); end
  def self.before_add_for_embeds_attachments?; end
  def self.before_add_for_embeds_blobs; end
  def self.before_add_for_embeds_blobs=(val); end
  def self.before_add_for_embeds_blobs?; end
  def self.before_remove_for_embeds_attachments; end
  def self.before_remove_for_embeds_attachments=(val); end
  def self.before_remove_for_embeds_attachments?; end
  def self.before_remove_for_embeds_blobs; end
  def self.before_remove_for_embeds_blobs=(val); end
  def self.before_remove_for_embeds_blobs?; end
  def self.defined_enums; end
  def self.with_attached_embeds(*args); end
  def to_plain_text; end
  def to_s(*args, &block); end
  def validate_associated_records_for_embeds_attachments(*args); end
  def validate_associated_records_for_embeds_blobs(*args); end
  include ActionText::RichText::GeneratedAssociationMethods
  include ActionText::RichText::GeneratedAttributeMethods
end
module ActionText::RichText::GeneratedAssociationMethods
  def embeds; end
  def embeds=(attachables); end
  def embeds_attachment_ids; end
  def embeds_attachment_ids=(ids); end
  def embeds_attachments; end
  def embeds_attachments=(value); end
  def embeds_blob_ids; end
  def embeds_blob_ids=(ids); end
  def embeds_blobs; end
  def embeds_blobs=(value); end
  def record; end
  def record=(value); end
  def reload_record; end
end
class ActionText::RichText::ActiveRecord_Relation < ActiveRecord::Relation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActionText::RichText::GeneratedRelationMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
end
module ActionText::RichText::GeneratedRelationMethods
  def with_attached_embeds(*args, &block); end
end
class ActionText::RichText::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActionText::RichText::GeneratedRelationMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
end
class ActionText::RichText::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActionText::RichText::GeneratedRelationMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
end
module ActionText::RichText::EmbedsAttachmentsAssociationExtension
  def purge; end
  def purge_later; end
end
module ActionText::Attachable
  def as_json(*arg0); end
  def attachable_content_type; end
  def attachable_filename; end
  def attachable_filesize; end
  def attachable_metadata; end
  def attachable_sgid; end
  def previewable_attachable?; end
  def self.attachable_from_sgid(sgid); end
  def self.from_attachable_sgid(sgid, options = nil); end
  def self.from_node(node); end
  def to_rich_text_attributes(attributes = nil); end
  def to_trix_content_attachment_partial_path; end
  extend ActiveSupport::Concern
end
module ActionText::Attachable::ClassMethods
  def from_attachable_sgid(sgid); end
end
