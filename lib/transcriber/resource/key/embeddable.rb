module Transcriber
  class Resource
    class Embeddable < Association
      include Parser::Embeddable
      include Response::Embeddable

      def raw?
        [Hash, Array].include?(resource_class)
      end

      def from_hash(attrs)
        return attrs if raw?
        super
      end

      def to_input(value, options = {})
        return value if raw?
        super
      end
    end
  end
end
