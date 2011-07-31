module Transcriber
  class Resource
    autoload :Serialization, 'transcriber/resource/serialization'
    autoload :Properties,    'transcriber/resource/properties'
    autoload :Property,      'transcriber/resource/properties/property'
    autoload :Embeddables,   'transcriber/resource/embeddables'
    autoload :Embeddable,    'transcriber/resource/embeddables/embeddable'
    autoload :Parsing,       'transcriber/resource/parsing'
    autoload :Responses,     'transcriber/resource/responses'

    extend  Properties
    extend  Embeddables
    extend  Parsing
    include Serialization

    def initialize(attrs = {})
      attrs.map {|name, value| send("#{name}=", value)}
    end

    def self.keys
      @keys ||= []
    end

    def resource
      self.class.keys.inject({}) {|buffer, key| buffer.merge key.to_resource}
    end

    def self.resources(entries)
      {entries: entries.map(&:resource)}
    end
  end
end
