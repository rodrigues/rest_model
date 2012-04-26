class RestModel
  module Source
    module Sender
      def to_source!(options = {})
        to_source({fail: true}.merge(options))
      end

      def to_source(options = {})
        source = {}
        errors = {}
        root_options = {without_nil: options[:without_nil], fail: options[:fail]}

        keys_to_source(options).each do |key|
          value = __send__(key.name)
          key_options = options.fetch(key.name, {}).merge(root_options)

          begin
            source.merge! key.to_source!(value, self, key_options)
          rescue TranslationError, SerializationError => e
            errors[key.name] = e.message
          rescue SourceError => e
            errors.merge!(e.message)
          end
        end

        fail SourceError, errors unless errors.empty? if options[:fail]

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
