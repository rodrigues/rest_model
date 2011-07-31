class Transcriber::Resource
  module Parser
    def parse(input, options = {})
      entries(input, options).collect {|item| parse_one(item)}
    end

    private

    def entries(entries, options)
      if start_key = options[:start_key]
        start_key = start_key.to_s.split('/')
        entries = entries[convert_input_keys(start_key)]
      end
      entries = [entries] if entries.kind_of?(Hash)
      entries
    end

    def parse_one(item)
      params = keys.inject({}) do |buffer, key|
        value = digg(item, key)
        buffer.merge key.name => key.parse(value)
      end
      self.new(params)
    end

    def digg(item, key)
      key.input_path.inject(item) {|buffer, key| buffer = buffer[key]}
    end
  end
end
