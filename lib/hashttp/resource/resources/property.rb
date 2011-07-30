class Hashttp::Resource
  module Resources
    module Property
      def resource_property(result, properties)
        properties.inject(result) do |buffer, property|
          buffer.merge property.name => __send__(property.name)
        end
      end
    end
  end
end