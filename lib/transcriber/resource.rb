module Transcriber
  class Resource
    autoload :Serialization, 'lib/transcriber/resource/serialization'
    autoload :Properties,    'lib/transcriber/resource/properties'
    autoload :Embeddables,   'lib/transcriber/resource/embeddables'
    autoload :Parsing,       'lib/transcriber/resource/parsing'
    autoload :Responses,     'lib/transcriber/resource/responses'

    extend  Properties
    extend  Embeddables
    extend  Parsing
    include Serialization

    def initialize(attrs = {})
      attrs.map {|name, value| send("#{name}=", value)}
    end

    def keys
      @keys ||= []
    end

    def resource
      keys.inject({}) {|buffer, key| buffer.merge key.to_resource}
    end

    def self.resources(entries)
      {entries: entries.map(&:resource)}
    end
  end
end
