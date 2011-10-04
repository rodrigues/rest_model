class RestModel
  class Key
    module Builder
      include Relation::Builder
      include Embeddable::Builder
      include Property::Builder

      def key(key)
        fail "you can't define a key with name '#{key.name}'" if not_allowed?(key)
        key.model = self
        attr_accessor key.name
        self.keys  << key
        self.id_key = key if key.options[:id]
      end

      def summarizes(*args)
        args.each do |name|
          key = keys.find {|key| key.name == name}
          summarized_keys << key if key
        end
      end

      private

      def not_allowed?(key)
        RestModel.not_allowed_names.include?(key.name.to_s)
      end
    end
  end
end
