module Transcriber
  class Resource
    module InputPath
      def self.resolve(options, convert_input_keys = Key::Converter::DefaultHandler)
        convert_input_keys.call keys_for_path(custom_path(options))
      end

      private

      def self.custom_path(options)
        options.slice(:start_key, :field)
      end

      def self.keys_for_path(path)
        path.empty? ? [] : path.values.first.to_s.split('.')
      end
    end
  end
end
