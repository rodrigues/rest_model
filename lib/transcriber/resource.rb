module Transcriber
  class Resource
    autoload :Parser,        'transcriber/resource/parser'
    autoload :Responses,     'transcriber/resource/responses'
    autoload :Serialization, 'transcriber/resource/serialization'
    autoload :Key,           'transcriber/resource/key'
    autoload :Properties,    'transcriber/resource/key/properties'
    autoload :Property,      'transcriber/resource/key/property/property'
    autoload :Embeddables,   'transcriber/resource/key/embeddables'
    autoload :Embeddable,    'transcriber/resource/key/embeddable/embeddable'

    extend  Properties
    extend  Embeddables
    extend  Parser
    include Serialization

    def initialize(attrs = {})
      attrs.map {|name, value| send("#{name}=", value)}
    end

    def self.keys
      @keys ||= []
    end

    def self.convert_input_keys
      @convert_input_keys || Key::Converter::DefaultHandler
    end

    def self.convert_input_keys=(&block)
      @convert_input_keys = block
    end

    def self.resources(entries)
      {entries: entries.map(&:resource)}
    end

    def resource
      self.class.keys.inject({}) {|buffer, key| buffer.merge key.to_resource(self)}
    end
  end
end
