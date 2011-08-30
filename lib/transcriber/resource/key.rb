module Transcriber
  class Resource
    class Key
      attr_accessor :name
      attr_accessor :model
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

      def visible?(resource)
        if present? resource
          return true if options[:visible].nil?
          return options[:visible] unless options[:visible].kind_of?(Proc)
          return resource.instance_eval &options[:visible]
        end
        false
      end

      def input_path
        return @input_path.clone if @input_path

        path = InputPath.resolve(options, convert_input_keys)

        if path.empty? and !root_path?
          path = convert_input_keys.call([name])
        end

        @input_path = path
        @input_path.clone
      end

      def root_path?
        path_definition = options.slice(:start_key, :field)
        path_definition.any? and path_definition.first[1].empty?
      end

      def convert_input_keys
        options.fetch(:convert_input_keys, model.try(:convert_input_keys) ||
                      Transcriber.configuration.convert_input_keys)
      end
    end
  end
end
