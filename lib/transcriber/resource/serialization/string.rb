module Transcriber
  class Resource
    module Serialization
      class String
        def self.serialize(value)
          value.nil? ? nil : value.to_s
        end
      end
    end
  end
end
