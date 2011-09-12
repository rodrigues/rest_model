module Transcriber
  class Resource
    class Property < Key
      include Parser::Property
      include Response::Property

      attr_accessor :serializer, :translations

      def initialize(name, options = {})
        super
        @serializer   = options.fetch(:type, Serialization::String)
        @translations = case values = options[:values]
                        when Proc then values
                        when Hash then values.invert
                        end
      end
    end
  end
end
