class RestModel
  module Serialization
    class String
      def self.serialize(value)
        value.nil? ? nil : value.to_s
      rescue
        raise SerializationError, "value '#{value}' is not a string"
      end

      def self.desserialize(value)
        value.nil? ? nil : value.to_s
      rescue
        raise SerializationError, "value '#{value}' is not a string"
      end
    end
  end
end
