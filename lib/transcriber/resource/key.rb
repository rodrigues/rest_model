module Transcriber
  class Resource
    class Key
      attr_accessor :name
      attr_accessor :options
      attr_accessor :summarize

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

      def convert_input_keys
        options.fetch(:convert_input_keys, Transcriber.configuration.convert_input_keys)
      end
    end
  end
end
