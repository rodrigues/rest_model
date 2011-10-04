module Transcriber
  class Resource
    module Source
      module Sender
        def to_source!(options = {})
          to_source(options.merge(fail: true))
        end

        def to_source(options = {})
          source = {}
          root_options = {without_nil: options[:without_nil], fail: options[:fail]}

          keys_to_source(options).each do |key|
            value = __send__(key.name)
            key_options = options.fetch(key.name, {}).merge(root_options)
            source.merge! key.to_source!(value, self, key_options)
          end

          source.with_indifferent_access
        end

        alias :to_input! :to_source!
        alias :to_input  :to_source

        private

        def keys_to_source(options)
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
end
