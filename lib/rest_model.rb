require "date"
require "active_support/inflector"
require "active_support/concern"
require "active_support/core_ext/object"
require "active_support/core_ext/class/attribute_accessors"
require "active_support/core_ext/object/try"
require "active_support/core_ext/array/wrap"
require "active_support/core_ext/array/access"
require "active_support/core_ext/hash/slice"
require "active_support/core_ext/hash/indifferent_access"
require "curb"
require "slogger"
require "multi_json"

require "rest_model/logger"
require "rest_model/source/path"
require "rest_model/source/translation"
require "rest_model/source/retriever"
require "rest_model/source/sender"
require "rest_model/response"
require "rest_model/serialization/boolean"
require "rest_model/serialization/date"
require "rest_model/serialization/date_time"
require "rest_model/serialization/enumerable"
require "rest_model/serialization/float"
require "rest_model/serialization/integer"
require "rest_model/serialization/string"
require "rest_model/serialization/symbol"
require "rest_model/key"
require "rest_model/key/property"
require "rest_model/key/property/builder"
require "rest_model/key/association"
require "rest_model/key/relation"
require "rest_model/key/relation/builder"
require "rest_model/key/embeddable"
require "rest_model/key/embeddable/builder"
require "rest_model/key/href"
require "rest_model/key/builder"
require "rest_model/configuration/client"
require "rest_model/configuration/keys"
require "rest_model/configuration/logger"
require "rest_model/configuration"
require "rest_model/client/http"
require "rest_model/client"
require "rest_model/errors"

class RestModel
  extend  Key::Builder
  extend  Source::Retriever
  include Source::Sender
  include Response
  include Serialization

  def initialize(attrs = {})
    return if attrs.nil? or attrs.empty?

    attrs = attrs.with_indifferent_access

    assign_non_keys_attrs(attrs)

    self.class.keys.each do |key|
      __send__("#{key.name}=", key.from_hash(attrs[key.name])) if key.present?(self)
    end
  end

  def update_attributes(attrs = {})
    return if attrs.nil? or attrs.empty?

    attrs = attrs.with_indifferent_access

    assign_non_keys_attrs(attrs)

    self.class.keys.each do |key|
      if key.present?(self) and attrs.has_key?(key.name)
        value = attrs[key.name]
        __send__("#{key.name}=", key.from_hash(value, __send__(key.name)))
      end
    end

    self
  end

  def resource_id
    __send__(id_key.name)
  end

  def self.id_key
    @id_key
  end

  def self.id_key=(id_key)
    @id_key = id_key
  end

  def self.resource_name=(resource_name)
    @resource_name = resource_name
  end

  def self.keys
    @keys ||= []
  end

  def self.summarized_keys
    @summarized_keys ||= []
  end

  def self.relations
    keys.find_all(&:relation?)
  end

  def self.resource_name(custom_name = nil)
    @resource_name ||= custom_name or to_s.demodulize.tableize
  end

  def self.convert_input_keys(converter = nil)
    @convert_input_keys = converter if converter
    @convert_input_keys
  end

  def self.not_allowed_names
    %w(resource_id resource)
  end

  private

  def assign_non_keys_attrs(attrs)
    key_names = self.class.keys.map(&:name)
    non_keys = attrs.reject {|k, v| key_names.member?(k.to_sym)}

    non_keys.each do |key, value|
      __send__("#{key}=", value) if self.respond_to?("#{key}=")
    end
  end
end
