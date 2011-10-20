class RestModel
  module Serialization
    class Date
      def self.serialize(value)
        ::Date.parse value
      rescue ArgumentError
        raise "value not serializable: #{value}"
      end

      def self.desserialize(value)
        date = value.kind_of?(::Date) ? value : ::Date.parse(value)
        format = RestModel::Configuration.date_format
        format ? date.strftime(format) : date.to_s
      rescue ArgumentError
        raise "value not desserializable: #{value}"
      end
    end
  end
end
