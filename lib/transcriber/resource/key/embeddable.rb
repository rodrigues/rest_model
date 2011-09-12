module Transcriber
  class Resource
    class Embeddable < Association
      include Parser::Embeddable
      include Response::Embeddable

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

      def from_hash(attrs)
        raw? ? attrs : super
      end

      def to_input(value, options = {})
        raw? ? value : super
      end
    end
  end
end
