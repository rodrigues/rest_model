class RestModel
  module Serialization
    class Enumerable
      def self.serialize(value)
        fail "value not serializable: #{value}" unless value.kind_of?(::Enumerable)
        value
      end

      def self.desserialize(value)
        fail "value not desserializable: #{value}" unless value.kind_of?(::Enumerable)
        value
      end
    end
  end
end
