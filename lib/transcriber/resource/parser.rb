module Transcriber
  class Resource
    module Parser
      def parse(input, options = {})
        prepare_entries(input, options).collect &method(:parse_item)
      end

      private

      def prepare_entries(input, options)
        path = InputPath.resolve(options, Transcriber.configuration.convert_input_keys)
        Array.wrap digg(input, path)
      end

      def parse_item(item)
        self.new.tap do |resource|
          keys.each do |key|
            value = digg(item, key.input_path)
            resource.__send__("#{key.name}=", key.parse(value)) if key.present?(resource)
          end
        end
      end

      def digg(input, path)
        path.inject(input) {|buffer, key| buffer = buffer[key]}
      end
    end
  end
end
