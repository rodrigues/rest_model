module Transcriber
  class Resource
    class Embeddable < Association
      include Parser::Embeddable
      include Response::Embeddable

      attr_accessor :fields

      def initialize(name, options = {})
        super

        if fields = options[:fields]
          @class_name = :array
          @fields = fields
        end
      end

      def raw?
        [Hash, Array].include?(resource_class)
      end
    end
  end
end
