module Transcriber
  class Resource
    module InputParser
      def to_input(options = {})
        input = {}
        keys_to_input(options).each do |key|
          value = __send__(key.name)
          parsed_value = key.to_input(value, options.fetch(key.name, {}))
          path = key.input_path

          if path.any?
            last = path.pop
            key_input = path.inject(input) {|buffer, key| buffer[key] = {}; buffer[key]}
            key_input[last] = parsed_value
          else
            input.merge!(parsed_value)
          end
        end
        input.with_indifferent_access
      end

      private

      def keys_to_input(options)
        self.class.keys.clone.tap do |keys|
          keys.reject! {|k| k.kind_of?(Relation)} unless options.fetch(:relations, true)
          keys.reject! {|k| Array(options[:without]).include?(k.name)}
        end
      end
    end
  end
end
