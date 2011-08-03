module Transcriber
  class Resource
    class Key
      include Converter

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

      def input_path
        return @input_path if @input_path
        path = InputPath.resolve(options, convert_input_keys)
        @input_path = path.empty? ? convert_input_keys.call([name]) : path
      end
    end
  end
end
