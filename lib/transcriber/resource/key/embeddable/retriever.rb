module Transcriber
  class Resource
    class Embeddable
      module Retriever
        def from_source(item, resource = nil)
          return handle_fields(item) if fields
          value = digg(item)
          parsed_value = raw? ? value : resource_class.from_source(value)
          one? ? parsed_value.first : parsed_value
        end

        def handle_fields(item)
          convert_input_keys.call(fields).map {|field| item[field]}
        end

        def digg(input)
          source_path.inject(input) {|buffer, key| buffer = buffer[key]}
        end
      end
    end
  end
end
