class Transcriber::Resource
  class Property < Key
    autoload :Parser,   'transcriber/resource/key/property/parser'
    autoload :Resource, 'transcriber/resource/key/property/resource'
    include   Parser
    include   Resource

    attr_accessor :serializer
    attr_accessor :values

    def initialize(name, options = {})
      super
      @serializer = options.fetch(:type, Serialization::String)
      @values     = options[:values]
    end
  end
end
