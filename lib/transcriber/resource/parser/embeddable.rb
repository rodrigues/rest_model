module Transcriber
  class Resource
    module Parser
      module Embeddable
        def parse(value, resource = nil)
          parsed_value = parse? ? resource_class.parse(value) : value
          one? ? parsed_value.first : parsed_value
        end

        private

        def parse?
          ![Hash, Array].include?(resource_class)
        end
      end
    end
  end
end
