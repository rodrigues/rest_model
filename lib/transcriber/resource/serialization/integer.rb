module Transcriber
  class Resource
    module Serialization
      class Integer
        def self.serialize(value)
          Integer(value)
        rescue ArgumentError
          raise "value not serializable: #{value}"
        end
      end
    end
  end
end
