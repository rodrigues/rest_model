module Transcriber
  class Resource
    class Key
      module InputPath
        def input_path
          @input_path ||= convert_input_keys.call keys_for_path(custom_path)
        end

        private

        def custom_path
          options.slice(:start_key, :field)
        end

        def keys_for_path(path)
          path.empty? ? [name] : path.values.first.to_s.split('.')
        end
      end
    end
  end
end
