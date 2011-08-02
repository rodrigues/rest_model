module Transcriber
  class Resource
    extend  Converter
    extend  Builder
    extend  Parser
    include Serialization

    cattr_accessor :id_key
    cattr_writer   :resource_name

    def self.attr_accessor(*args)
      fail "#{args[0]} is not allowed." if not_allowed_names.include?(args[0].to_s)
      super
    end

    def self.not_allowed_names
      ["resource_id", "resource", "links"]
    end

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

    def resource_id
      __send__(id_key.name)
    end

    def resource(options = {})
      root = options.fetch(:root, true)
      resource = self.class.keys.inject({}) {|buffer, key| buffer.merge key.to_resource(self)}
      resource.merge!({links: links}) if root and self.class.relations.any?
      resource
    end

    def links
      self.class.relations.map {|key| key.to_relation(self)}
    end
  end
end
