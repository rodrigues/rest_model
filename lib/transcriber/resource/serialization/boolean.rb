class Transcriber::Resource
  module Serialization
    class Boolean
      MAPPINGS = {true  => [true,  "true",  "TRUE",  "1", 1, 1.0, "x", "X", "t", "T"],
                  false => [false, "false", "FALSE", "0", 0, 0.0,  "", " ", "f", "F", nil]}

      def self.serialize(value)
        return true  if MAPPINGS[true].include?(value)
        return false if MAPPINGS[false].include?(value)
        raise "value not serializable: #{{value: value, mappings: MAPPINGS}}"
      end
    end
  end
end
