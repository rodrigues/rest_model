class Transcriber::Resource
  module Parser
    def parse(input, options = {})
      prepare_entries(input, options).collect &method(:parse_one)
    end

    private

    def prepare_entries(input, options)
      path = options[:start_key]
      path = path ? path.to_s.split('/') : []
      Array.wrap(digg(input, path))
    end

    def parse_one(item)
      params = keys.inject({}) do |buffer, key|
        value = digg(item, key.input_path)
        buffer.merge key.name => key.parse(value)
      end
      self.new(params)
    end

    def digg(input, path)
      path.inject(input) {|buffer, key| buffer = buffer[key]}
    end
  end
end
