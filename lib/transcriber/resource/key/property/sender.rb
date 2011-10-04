module Transcriber
  class Resource
    class Property
      module Sender
        def to_source!(value, resource, options = {})
          source_value = nil

          begin
            if translations
              source_value = translate_to_source(value, resource)
            else
              source_value = serializer.desserialize(value)
            end
          rescue => exception
            raise exception if options[:fail]
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

        def translate_to_source(value, resource)
          case translations
          when Proc then resource.instance_eval(&translations)
          when Hash
            fail "to input error" unless translations.has_key?(value)
            translations[value]
          end
        end
      end
    end
  end
end
