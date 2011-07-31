class Transcriber::Resource::Key
  module InputPath
    def input_path(options = self.options)
      @input_path ||= case path = options.slice(:start_key, :field)
                      when {} then
                        convert_input_keys.call([name])
                      when Hash then
                        convert_input_keys.call(path.values.first.to_s.split('/'))
                      when Enumerable then
                        convert_input_keys.call(path)
                      end
    end
  end
end
