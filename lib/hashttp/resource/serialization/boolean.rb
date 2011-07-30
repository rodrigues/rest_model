module Hashttp
  class Resource
    module Serialization
      class Boolean
        def self.serialize(value)
          value == "X"
        end
      end
    end
  end
end