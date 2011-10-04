module Transcriber
  class Resource
    class Property < Key
      autoload :Sender,    "transcriber/resource/key/property/sender"
      autoload :Retriever, "transcriber/resource/key/property/retriever"
      autoload :Response,  "transcriber/resource/key/property/response"
      include   Sender
      include   Retriever
      include   Response

      attr_accessor :serializer, :translations

      def initialize(name, options = {})
        super
        @serializer   = options.fetch(:type, Serialization::String)
        @translations = options[:values]
      end

      def from_hash(value, resource = nil)
        value
      end
    end
  end
end
