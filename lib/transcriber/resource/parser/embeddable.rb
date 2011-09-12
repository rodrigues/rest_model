module Transcriber
  class Resource
    module Parser
      module Embeddable
        def parse(item, resource = nil)
          value = nil
          if fields
            value = convert_input_keys.call(fields).map {|field| item[field]}
          else
            value = digg(item)
            parsed_value = raw? ? value : resource_class.parse(value)
            value = one? ? parsed_value.first : parsed_value
          end
        end

        def digg(input)
          input_path.inject(input) {|buffer, key| buffer = buffer[key]}
        end

        def from_hash(attrs)
          raw? ? attrs : super
        end

        def to_input(value, options = {})
          input = {}
          return input if value.nil?

          path = input_path

          if path.any?
            last = path.pop
            key_input = path.inject(input) {|buffer, key| buffer[key] = {}; buffer[key]}

            if fields
              convert_input_keys.call(fields).each_with_index do |field, index|
                input[field] = value[index]
              end
            elsif raw?
              key_input[last] = value
            elsif one?
              key_input[last] = value.to_input(options)
            else
              key_input[last] = value.map {|item| item.to_input(options)}
            end
          else
            input.merge!(value.to_input(options))
          end

          input
        end
      end
    end
  end
end
