module Transcriber
  class Resource
    module Parser
      module Embeddable
        def parse(value, resource = nil)
          parsed_value = raw? ? value : resource_class.parse(value)
          one? ? parsed_value.first : parsed_value
        end
      end
    end
  end
end
