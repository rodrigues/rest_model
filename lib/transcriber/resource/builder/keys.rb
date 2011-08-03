module Transcriber
  class Resource
    module Builder
      module Keys
        def key(key)
          fail "you can't define a key with name '#{key.name}'" if not_allowed?(key)
          attr_accessor key.name
          self.keys  << key
          self.id_key = key if key.options[:id]
        end

        private

        def not_allowed?(key)
          Resource.not_allowed_names.include?(key.name.to_s)
        end
      end
    end
  end
end
