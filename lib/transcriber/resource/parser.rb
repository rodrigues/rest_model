class Transcriber::Resource
  module Parser
    def parse(input, options = {})
      prepare_entries(input, options).collect &method(:parse_one)
    end

    private

    def prepare_entries(input, options)
      if start_key = options[:start_key]
        start_key = start_key.to_s.split('/')
        input = input[convert_input_keys(start_key)]
      end
      Array.wrap(input)
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
