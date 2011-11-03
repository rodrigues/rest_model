class RestModel
  module Serialization
    class DateTime
      def self.serialize(value)
        ::DateTime.parse value
      rescue ArgumentError
        raise SerializationError, "value '#{value}' is an invalid datetime"
      end

      def self.desserialize(value)
        datetime = value.kind_of?(::DateTime) ? value : ::DateTime.parse(value)
        format = RestModel::Configuration.datetime_format
        format ? datetime.strftime(format) : datetime.to_s
      rescue ArgumentError
        raise SerializationError, "value '#{value}' is an invalid datetime"
      end
    end
  end
end
