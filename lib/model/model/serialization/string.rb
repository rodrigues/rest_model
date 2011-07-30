module Hashttp
  class Model
    module Serialization
      class String
        def self.serialize(value)
          value
        end
      end
    end
  end
end