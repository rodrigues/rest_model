class Transcriber::Resource
  module Serialization
    class Float
      def self.serialize(value)
        Float(value)
      rescue
        raise "value not serializable: #{{value: value}}"
      end
    end
  end
end
