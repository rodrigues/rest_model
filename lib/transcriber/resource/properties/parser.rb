class Transcriber::Resource::Property
  module Parser
    def parse(item, options = {})
      puts "item: #{item}, options: #{options}, field: #{field}, serializer: #{serializer.inspect}"
      value = serializer.serialize(item[field])
      value = values.key(value) if values
      value
    end
  end
end
