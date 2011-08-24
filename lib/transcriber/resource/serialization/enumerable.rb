module Transcriber
  class Resource
    module Serialization
      class Enumerable
        def self.serialize(value)
          fail "value not serializable: #{value}" unless value.kind_of?(::Enumerable)
          value
        end
      end
    end
  end
end