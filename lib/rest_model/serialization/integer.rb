class RestModel
  module Serialization
    class Integer
      def self.serialize(value)
        Integer(value)
      rescue ArgumentError
        raise "value not serializable: #{value}"
      end

      def self.desserialize(value)
        Integer(value)
      rescue ArgumentError
        raise "value not desserializable: #{value}"
      end
    end
  end
end
