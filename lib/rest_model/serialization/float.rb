class RestModel
  module Serialization
    class Float
      def self.serialize(value, options = {})
        Float(value)
      rescue
        raise SerializationError, "value '#{value}' is not a float"
      end

      def self.desserialize(value, options = {})
        Float(value)
      rescue
        raise SerializationError, "value '#{value}' is not a float"
      end
    end
  end
end
