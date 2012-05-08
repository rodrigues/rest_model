class RestModel
  module Serialization
    class Enumerable
      def self.serialize(value, options = {})
        fail SerializationError, "value '#{value}' is not an enumerable" unless value.kind_of?(::Enumerable)

        value
      end

      def self.desserialize(value, options = {})
        fail SerializationError, "value '#{value}' is not an enumerable" unless value.kind_of?(::Enumerable)

        value
      end
    end
  end
end
