class Transcriber::Resource
  class Property < Key
    autoload :Parser,   'transcriber/resource/property/parser'
    autoload :Resource, 'transcriber/resource/property/resource'
    include   Parser
    include   Resource

    attr_accessor :serializer
    attr_accessor :values

    def initialize(name, options = {})
      @serializer = options.fetch(:type, Serialization::String)
      @values     = options.fetch(:values)
    end
  end
end
