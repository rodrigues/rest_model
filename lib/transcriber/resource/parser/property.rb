module Transcriber
  class Resource
    module Parser
      module Property
        def parse(value, resource = nil)
          translate(serializer.serialize(value), resource)
        end

        def translate(value, resource)
          case translations
          when nil
            value
          when Hash
            translations[value]
          when Proc
            resource.instance_eval &translations
          end
        end
      end
    end
  end
end
