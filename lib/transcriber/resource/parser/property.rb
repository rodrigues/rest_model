module Transcriber
  class Resource
    module Parser
      module Property
        def parse(item, resource = nil)
          value = digg(item)
          translate(serializer.serialize(value), resource)
        end

        def digg(input)
          input_path.inject(input) {|buffer, key| buffer = buffer[key]}
        end

        def translate(value, resource)
          case translations
          when nil  then value
          when Hash then translations[value]
          when Proc then resource.instance_eval(&translations)
          end
        end
      end
    end
  end
end
