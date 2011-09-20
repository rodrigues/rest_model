module Transcriber
  class Resource
    module Parser
      module Property
        def parse(item, resource = nil)
          value = digg(item)
          translate_from_input(serializer.serialize(value), resource)
        end

        def digg(input)
          input_path.inject(input) {|buffer, key| buffer = buffer[key]}
        end

        def translate_from_input(value, resource)
          case translations
          when nil  then value
          when Hash then translations.key(value)
          when Proc then resource.instance_eval(&translations)
          end
        end

        def translate_to_input(value, resource)
          case translations
          when nil  then value
          when Hash then translate_to_input_from_hash(value)
          when Proc then resource.instance_eval(&translations)
          end
        end

        def translate_to_input_from_hash(value)
          other = value.kind_of?(Symbol) ? value.to_s : value.to_sym
          translations.key?(value) ? translations[value] : translations.fetch(other, value)
        end

        def from_hash(value)
          value
        end

        def to_input(value, resource, options = {});
          value = translate_to_input(value, resource)
          input = {}
          path = input_path

          if path.any?
            last = path.pop
            key_input = path.inject(input) {|buffer, key| buffer[key] = {}; buffer[key]}
            key_input[last] = value
          else
            input.merge!(value)
          end

          input
        end
      end
    end
  end
end
