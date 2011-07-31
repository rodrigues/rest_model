class Transcriber::Resource
  module Serialization
    class Date
      def self.serialize(value)
        begin
          ::Date.parse value
        rescue
          raise "value not serializable: #{{value: value}}"
        end
      end
    end
  end
end
