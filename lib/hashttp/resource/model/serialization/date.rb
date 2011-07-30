module Hashttp
  class Model
    module Serialization
      class Date
        def self.serialize(value)
          ::Date.parse value
        end
      end
    end
  end
end