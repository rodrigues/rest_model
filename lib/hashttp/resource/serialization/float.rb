module Hashttp
  class Resource
    module Serialization
      class Float
        def self.serialize(value)
          value.to_f
        end
      end
    end
  end
end