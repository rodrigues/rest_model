class RestModel
  module Serialization
    class Integer
      def self.serialize(value, options = {})
        case value
        when ::String
          if value =~ /^\-?\d+$/
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

      def self.desserialize(value, options = {})
        length = options.fetch(:padding_zeros, 0)
        return serialize(value) if length == 0
        serialize(value).to_s.rjust(length, "0")
      end
    end
  end
end
