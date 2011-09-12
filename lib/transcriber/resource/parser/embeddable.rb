module Transcriber
  class Resource
    module Parser
      module Embeddable
        def parse(item, resource = nil)
          value = nil
          if raw? and options[:fields]
            value = options[:fields].map do |field|
              item[convert_input_keys.call(field)]
            end
          else
            value = digg(item)
            parsed_value = raw? ? value : resource_class.parse(value)
            value = one? ? parsed_value.first : parsed_value
          end
        end

        def digg(input)
          input_path.inject(input) {|buffer, key| buffer = buffer[key]}
        end
      end
    end
  end
end
