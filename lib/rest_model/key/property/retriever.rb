class RestModel
  class Property
    module Retriever
      def from_source(item, resource = nil)
        value = digg(item)
        translate_from_source(serializer.serialize(value), resource)
      end

      def digg(input)
        source_path.inject(input) {|buffer, key| buffer = buffer[key]}
      end

      def translate_from_source(value, resource)
        case translations
        when nil  then value
        when Proc then resource.instance_eval(&translations)
        when Hash
          fail "from input error" unless translations.has_value?(value)
          translations.key(value)
        end
      end
    end
  end
end
