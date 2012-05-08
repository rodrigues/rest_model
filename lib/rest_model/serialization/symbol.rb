class RestModel
  module Serialization
    class Symbol
      def self.serialize(value, options = {})
        value.to_s.to_sym
      rescue
        raise SerializationError, "value '#{value}' is not a symbol"
      end

      def self.desserialize(value, options = {})
        serialize(value)
      end
    end
  end
end
