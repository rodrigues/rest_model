class RestModel
  module Serialization
    class String
      def self.serialize(value, options = {})
        value.nil? ? nil : value.to_s
      rescue
        raise SerializationError, "value '#{value}' is not a string"
      end

      def self.desserialize(value, options = {})
        serialize(value)
      end
    end
  end
end
