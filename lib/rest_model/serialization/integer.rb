class RestModel
  module Serialization
    class Integer
      def self.serialize(value)
        Integer(value)
      rescue ArgumentError
        raise SerializationError, "value '#{value}' is not an integer"
      end

      def self.desserialize(value)
        Integer(value)
      rescue ArgumentError
        raise SerializationError, "value '#{value}' is not an integer"
      end
    end
  end
end
