module Transcriber
  class Resource
    class Key
      module Converter
        DefaultHandler = lambda {|keys| keys.map(&:to_s)}

        attr_writer :convert_input_keys

        def convert_input_keys
          options.fetch(:convert_input_keys, Transcriber::Resource.convert_input_keys)
        end
      end
    end
  end
end
