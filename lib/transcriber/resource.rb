module Transcriber
  class Resource
    extend  Builder
    extend  Parser
    include Response
    include Serialization

    cattr_accessor :id_key
    cattr_writer   :resource_name

    def initialize(attrs = {})
      attrs.map {|name, value| send("#{name}=", value)}
    end

    def self.keys
      @keys ||= []
    end

    def self.relations
      @keys.find_all {|k| k.kind_of?(Relation)}
    end

    def self.resource_name(custom_name = nil)
      @resource_name ||= custom_name or to_s.demodulize.tableize
    end

    def self.convert_input_keys(converter = nil)
      @convert_input_keys = converter if converter
      @convert_input_keys
    end

    def resource_id
      __send__(id_key.name)
    end

    def self.method_added(method_name)
      return unless not_allowed_names.include?(method_name.to_s)
      puts "warning: redefining '#{method_name}' may cause serious problems"
    end

    def self.not_allowed_names
      ["resource_id", "resource", "link"]
    end
  end
end
