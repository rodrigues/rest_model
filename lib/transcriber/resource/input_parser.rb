module Transcriber
  class Resource
    module InputParser
      def to_input(options = {})
        input = {}

        keys_to_input(options).each do |key|
          value = __send__(key.name)
          key_options = options.fetch(key.name, {without_nil: options[:without_nil]})
          input.merge! key.to_input(value, self, key_options)
        end

        input.with_indifferent_access
      end

      private

      def keys_to_input(options)
        self.class.keys.clone.tap do |keys|
          keys.reject! {|k| k.kind_of?(Relation)}
          keys.reject! {|k| Array(options[:without]).include?(k.name)}

          keys.reject! do |key|
            __send__(key.name).nil? and options[:without_nil]
          end
        end
      end
    end
  end
end
