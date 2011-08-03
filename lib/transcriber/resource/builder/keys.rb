module Transcriber
  class Resource
    module Builder
      module Keys
        def key(key)
          attr_accessor key.name
          self.keys  << key
          self.id_key = key if key.options[:id]
        end
      end
    end
  end
end
