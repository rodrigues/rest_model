class RestModel
  module Source
    class Translation
      attr_accessor :values, :from_source, :to_source

      def initialize(attrs = {})
        @values      = attrs[:values]
        @from_source = attrs[:from_source]
        @to_source   = attrs[:to_source]
      end

      def translate_from_source(value, resource)
        if from_source
          resource.instance_exec(value, &from_source)
        elsif values
          fail "from source error" unless values.has_value?(value)
          values.key(value)
        else
          value
        end
      end

      def translate_to_source(value, resource)
        if to_source
          resource.instance_exec(value, &to_source)
        elsif values
          fail "to source error" unless values.has_key?(value)
          values[value]
        else
          value
        end
      end
    end
  end
end
