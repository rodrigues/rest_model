class Hashttp::Model
  module Parsing
    module Property
      def parse_properties(params, item)
        properties.inject(params) do |buffer, property|
          buffer.merge property.name => parse_property(property, item)
        end
      end

      private

      def parse_property(property, item)
        value = property.serializer.serialize(item[property.field])
        unless property.values.nil?
          value = property.values.key value
        end
        value
      end
    end
  end
end