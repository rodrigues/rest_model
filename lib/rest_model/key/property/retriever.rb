class RestModel
  class Property
    module Retriever
      def from_source(item, resource = nil)
        value = digg(item)
        translation.translates_from_source? ? translation.translate_from_source(value, resource)
                                            : serializer.serialize(value)
      end

      def digg(input)
        source_path.inject(input) {|buffer, key| buffer = buffer[key]}
      end
    end
  end
end
