class Transcriber::Resource
  module Parser
    def parse(input, options = {})
      prepare_entries(input, options).collect &method(:parse_item)
    end

    private

    def prepare_entries(input, options)
      path = options[:start_key]
      path = path ? path.to_s.split('/') : []
      Array.wrap digg(input, path)
    end

    def parse_item(item)
      resource = self.new
      keys.each do |key|
        value = digg(item, key.input_path)
        resource.__send__("#{key.name}=", key.parse(value)) if key.present?(resource)
      end
      resource
    end

    def digg(input, path)
      path.inject(input) {|buffer, key| buffer = buffer[key]}
    end
  end
end
