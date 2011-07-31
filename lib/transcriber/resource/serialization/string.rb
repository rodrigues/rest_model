class Transcriber::Resource
  module Serialization
    class String
      def self.serialize(value)
        value.nil? ? nil : "#{value}"
      end
    end
  end
end
