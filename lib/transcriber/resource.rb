module Transcriber
  class Resource
    autoload :Converter,     'transcriber/resource/converter'
    autoload :Parser,        'transcriber/resource/parser'
    autoload :Response,      'transcriber/resource/response'
    autoload :Serialization, 'transcriber/resource/serialization'
    autoload :Key,           'transcriber/resource/key'
    autoload :Property,      'transcriber/resource/key/property'
    autoload :Relation,      'transcriber/resource/key/relation'
    autoload :Embeddable,    'transcriber/resource/key/embeddable'
    autoload :Association,   'transcriber/resource/key/association'
    autoload :Builder,       'transcriber/resource/builder'

    extend  Converter
    extend  Builder
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
