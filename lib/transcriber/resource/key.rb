module Transcriber
  class Resource
    class Key
      include Converter
      include InputPath

      attr_accessor :name
      attr_accessor :options

      def initialize(name, options = {})
        @name    = name
        @options = options
      end

      def present?(resource)
        return true unless options[:if]
        resource.instance_eval &options[:if]
      end
    end
  end
end
