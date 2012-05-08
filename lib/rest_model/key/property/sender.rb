class RestModel
  class Property
    module Sender
      def to_source!(value, resource, options = {})
        source_value = begin
          translation.translates_to_source? ? translation.translate_to_source(value, resource)
                                            : serializer.desserialize(value, self.options)

        rescue TranslationError, SerializationError => error
          raise error if options[:fail] and validates?(value)
        end

        source = {}
        path = source_path

        if path.any?
          last = path.pop
          key_source = path.inject(source) {|buffer, key| buffer[key] = {}; buffer[key]}
          key_source[last] = source_value
        else
          source.merge!(source_value)
        end

        source
      end

      private

      def validates?(value)
        (self.options[:validate_if_present] and value.present?) or self.options[:validate]
      end
    end
  end
end
