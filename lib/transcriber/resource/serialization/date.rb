module Transcriber
  class Resource
    module Serialization
      class Date
        def self.serialize(value)
          ::Date.parse value
        rescue ArgumentError
          raise "value not serializable: #{value}"
        end
      end
    end
  end
end
