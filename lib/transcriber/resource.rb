module Transcriber
  class Resource
    autoload :Converter,     'transcriber/resource/converter'
    autoload :Parser,        'transcriber/resource/parser'
    autoload :Response,      'transcriber/resource/response'
    autoload :Serialization, 'transcriber/resource/serialization'
    autoload :Key,           'transcriber/resource/key'
    autoload :Properties,    'transcriber/resource/key/properties'
    autoload :Property,      'transcriber/resource/key/property/property'
    autoload :Embeddables,   'transcriber/resource/key/embeddables'
    autoload :Embeddable,    'transcriber/resource/key/embeddable/embeddable'

    extend  Converter
    extend  Properties
    extend  Embeddables
    extend  Parser
    include Serialization

    cattr_accessor :id_key

    def initialize(attrs = {})
      attrs.map {|name, value| send("#{name}=", value)}
    end

    def self.keys
      @keys ||= []
    end

    def resource
      self.class.keys.inject({}) {|buffer, key| buffer.merge key.to_resource(self)}
    end
  end
end
