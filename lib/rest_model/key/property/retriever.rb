class RestModel
  class Property
    module Retriever
      def from_source(item, resource = nil)
        value = digg(item)
        translation.translate_from_source(serializer.serialize(value), resource)
      end

      def digg(input)
        source_path.inject(input) {|buffer, key| buffer = buffer[key]}
      end
    end
  end
end
