module Transcriber
  class Resource
    class Property < Key
      autoload :Parser,   "transcriber/resource/key/property/parser"
      autoload :Response, "transcriber/resource/key/property/response"
      include Parser
      include Response

      attr_accessor :serializer, :translations

      def initialize(name, options = {})
        super
        @serializer   = options.fetch(:type, Serialization::String)
        @translations = options[:values]
      end
    end
  end
end
