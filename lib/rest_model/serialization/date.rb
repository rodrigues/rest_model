class RestModel
  module Serialization
    class Date
      def self.serialize(value, options = {})
        ::Date.parse value
      rescue
        raise SerializationError, "value '#{value}' is an invalid date"
      end

      def self.desserialize(value, options = {})
        date = value.kind_of?(::Date) ? value : ::Date.parse(value)
        format = options.fetch(:format, RestModel::Configuration.date_format)
        format ? date.strftime(format) : date.to_s
      rescue
        raise SerializationError, "value '#{value}' is an invalid date"
      end
    end
  end
end
