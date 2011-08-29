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
        @translations = options[:values]        if options[:values].kind_of?(Proc)
        @translations = options[:values].invert if options[:values].kind_of?(Hash)
      end

      def from_hash(value)
        value
      end
    end
  end
end
