class Transcriber::Resource::Key
  module InputPath
    def input_path(options = self.options)
      path = custom_path(options)
      @input_path ||= convert_input_keys.call keys_for_path(path)
    end

    private

    def custom_path(options)
      options.slice(:start_key, :field)
    end

    def keys_for_path(path)
      path.empty? ? [name] : path.values.first.to_s.split('/')
    end
  end
end