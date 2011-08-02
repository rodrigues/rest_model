module Transcriber
  class Resource
    module Parser
      module Property
        def parse(value)
          translate serializer.serialize(value)
        end

        def translate(value)
          translations ? translations[value] : value
        end
      end
    end
  end
end
