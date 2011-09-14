module Transcriber
  class Resource
    module InputParser
      def to_input(options = {})
        input = {}

        keys_to_input(options).each do |key|
          value = __send__(key.name)
          input.merge! key.to_input(value, options.fetch(key.name, {}))
        end

        input.with_indifferent_access
      end

      private

      def keys_to_input(options)
        self.class.keys.clone.tap do |keys|
          keys.reject! {|k| k.kind_of?(Relation)}
          keys.reject! {|k| Array(options[:without]).include?(k.name)}
        end
      end
    end
  end
end
