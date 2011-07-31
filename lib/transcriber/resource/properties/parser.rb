class Transcriber::Resource::Property
  module Parser
    def parse(item, options = {})
      value = serializer.serialize(item[field])
      value = values.key(value) if values
      value
    end
  end
end
