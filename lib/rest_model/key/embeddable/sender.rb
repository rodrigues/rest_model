class RestModel
  class Embeddable
    module Sender
      def to_source!(value, resource, options = {})
        return {} if value.nil?

        fields ? to_multiple_source(value, options)
               : to_single_source(value, options)
      end

      private

      def to_single_source(value, options)
        source = {}
        path = source_path

        if path.any?
          last = path.pop
          key_source = path.inject(source) {|buffer, key| buffer[key] = {}; buffer[key]}
          key_source[last] = raw? ? value
                                  : one? ? value.to_source(options)
                                         : value.map {|item| item.to_source(options)}
        else
          source.merge!(value.to_source(options))
        end

        source
      end

      def to_multiple_source(value, options)
        input = {}
        mapped_fields = convert_input_keys.call(fields)

        value.each_with_index do |item, index|
          input[mapped_fields[index]] = item
        end

        input
      end
    end
  end
end
