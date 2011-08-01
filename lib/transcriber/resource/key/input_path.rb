class Transcriber::Resource::Key
  module InputPath
    def input_path(options = self.options)
      return @input_path if @input_path
      path = options.slice(:start_key, :field)
      keys = path.empty? ? [name] : path.values.first.to_s.split('/')
      @input_path = convert_input_keys.call(keys)
    end
  end
end