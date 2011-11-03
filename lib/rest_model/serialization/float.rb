class RestModel
  module Serialization
    class Float
      def self.serialize(value)
        Float(value)
      rescue
        raise SerializationError, "value '#{value}' is not a float"
      end

      def self.desserialize(value)
        Float(value)
      rescue
        raise SerializationError, "value '#{value}' is not a float"
      end
    end
  end
end
