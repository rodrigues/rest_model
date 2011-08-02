module Transcriber
  class Resource
    module Serialization
      class Float
        def self.serialize(value)
          Float(value)
        rescue ArgumentError
          raise "value not serializable: #{value}"
        end
      end
    end
  end
end
