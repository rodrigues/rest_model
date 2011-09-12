module Transcriber
  class Resource
    class Key
      attr_accessor :name, :model, :options, :summarize

      def initialize(name, options = {})
        @name    = name
        @options = options
      end

      def present?(resource)
        !options[:if] ? true : resource.instance_eval(&options[:if])
      end

      def visible?(resource)
        !present?(resource) ? false : case visible = options[:visible]
                                      when nil  then true
                                      when Proc then resource.instance_eval(&visible)
                                      else visible
                                      end
      end

      def input_path
        return @input_path.clone if @input_path

        @input_path = InputPath.resolve(options, convert_input_keys)

        if @input_path.empty? and !root_path?
          @input_path = convert_input_keys.call([name])
        end

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
