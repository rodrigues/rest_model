class Transcriber::Resource
  module Parser
    def parse(input, options = {})
      entries(input, options).collect {|item| parse_one(item)}
    end

    private

    def entries(input, options)
      start_key = options[:start_key]
      entries = input
      if entries.kind_of?(Hash)
        entries = entries[start_key.to_s.upcase] if start_key
        entries = [entries]
      end
      entries
    end

    def parse_one(item)
      params = keys.inject({}) do |buffer, key|
        buffer.merge key.name => key.parse(item)
      end
      self.new(params)
    end
  end
end
