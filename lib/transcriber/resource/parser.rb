module Transcriber
  class Resource
    module Parser
      def parse!(input, options = {})
        parse(input, options.merge(fail: true))
      end

      def parse(input, options = {})
        prepare_entries(input, options).collect do |item|
          parse_item(HashWithIndifferentAccess.new(item), options)
        end
      end

      private

      def prepare_entries(input, options)
        path = InputPath.resolve(options, Transcriber.configuration.convert_input_keys)
        Array.wrap digg(input, path)
      end

      def parse_item(item, options)
        self.new.tap do |resource|
          keys.each do |key|
            begin
              resource.__send__("#{key.name}=", key.parse(item, resource)) if key.present?(resource)
            rescue => exception
              raise exception if options[:fail]
            end
          end
        end
      end

      def digg(input, path)
        path.inject(input) {|buffer, key| buffer = buffer[key]}
      end
    end
  end
end
