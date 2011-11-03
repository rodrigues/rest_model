class RestModel
  module Serialization
    class DateTime
      def self.serialize(value)
        ::DateTime.parse value
      rescue
        raise SerializationError, "value '#{value}' is an invalid date time"
      end

      def self.desserialize(value)
        date_time = value.kind_of?(::DateTime) ? value : ::DateTime.parse(value)
        format = RestModel::Configuration.date_time_format
        format ? date_time.strftime(format) : date_time.to_s
      rescue
        raise SerializationError, "value '#{value}' is an invalid date time"
      end
    end
  end
end
