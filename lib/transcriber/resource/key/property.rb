module Transcriber
  class Resource
    class Property < Key
      include Parser::Property
      include Response::Property

      attr_accessor :serializer
      attr_accessor :translations

      def initialize(name, options = {})
        super
        @serializer   = options.fetch(:type, Serialization::String)
        @translations = options[:values].try(:invert)
      end
    end
  end
end
