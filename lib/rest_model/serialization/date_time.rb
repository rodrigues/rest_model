class RestModel
  module Serialization
    class DateTime
      def self.serialize(value, options = {})
        ::DateTime.parse value
      rescue
        raise SerializationError, "value '#{value}' is an invalid date time"
      end

      def self.desserialize(value, options = {})
        date_time = value.kind_of?(::DateTime) ? value : ::DateTime.parse(value)
        format = options.fetch(:format, RestModel::Configuration.date_time_format)
        format ? date_time.strftime(format) : date_time.to_s
      rescue
        raise SerializationError, "value '#{value}' is an invalid date time"
      end
    end
  end
end
