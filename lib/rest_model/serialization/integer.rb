class RestModel
  module Serialization
    class Integer
      def self.serialize(value)
        case value
        when String
          if value =~ /^\d+$/
            value.to_i
          else
            raise
          end
        else
          Integer(value)
        end
      rescue
        raise SerializationError, "value '#{value}' is not an integer"
      end

      def self.desserialize(value)
        serialize(value)
      end
    end
  end
end
