module Transcriber
  class Resource
    module Parser
      module Embeddable
        def parse(item, resource = nil)
          return parse_fields(item) if fields
          value = digg(item)
          parsed_value = raw? ? value : resource_class.parse(value)
          one? ? parsed_value.first : parsed_value
        end

        def parse_fields(item)
          convert_input_keys.call(fields).map {|field| item[field]}
        end

        def digg(input)
          input_path.inject(input) {|buffer, key| buffer = buffer[key]}
        end

        def from_hash(attrs)
          raw? ? attrs : super
        end

        def to_input(value, resource, options = {})
          return {} if value.nil?
          fields ? to_multiple_input(value, options)
                 : to_single_input(value)
        end

        private

        def to_single_input(value)
          input = {}
          path = input_path

          if path.any?
            last = path.pop
            key_input = path.inject(input) {|buffer, key| buffer[key] = {}; buffer[key]}
            key_input[last] = raw? ? value
                                   : one? ? value.to_input(options)
                                          : value.map {|item| item.to_input(options)}
          else
            input.merge!(value.to_input(options))
          end

          input
        end

        def to_multiple_input(value, options)
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
end
