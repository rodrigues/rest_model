module Transcriber
  class Resource
    autoload :Converter,     'transcriber/resource/converter'
    autoload :Parser,        'transcriber/resource/parser'
    autoload :Response,      'transcriber/resource/response'
    autoload :Serialization, 'transcriber/resource/serialization'
    autoload :Key,           'transcriber/resource/key'
    autoload :Property,      'transcriber/resource/key/property'
    autoload :Association,   'transcriber/resource/key/association'
    autoload :Relation,      'transcriber/resource/key/relation'
    autoload :Embeddable,    'transcriber/resource/key/embeddable'
    autoload :Builder,       'transcriber/resource/builder'

    extend  Converter
    extend  Builder
    extend  Parser
    include Serialization

    cattr_accessor :id_key
    cattr_writer :resource_name

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

    def self.relations
      @relations ||= []
    end

    def self.keys
      @keys ||= []
    end

    def self.resource_name
      @resource_name || to_s.demodulize.downcase.pluralize
    end

    def resource_id
      __send__(id_key.name)
    end

    def resource
      resource = self.class.keys.inject({}) {|buffer, key| buffer.merge key.to_resource(self)}
      resource.merge!({links: links}) if self.class.relations.any?
      resource
    end

    def links
      self.class.relations.map {|key| key.to_relation(self)}
    end
  end
end
