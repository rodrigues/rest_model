class Transcriber::Resource::Key
  module InputPath
    def input_path(options = self.options)
      return @input_path if @input_path
      path = options.slice(:start_key, :field)
      path = case path
             when {}         then [name]
             when Hash       then path.values.first.to_s.split('/')
             end
      @input_path = convert_input_keys.call(path)
    end
  end
end
