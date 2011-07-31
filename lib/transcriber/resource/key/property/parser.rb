class Transcriber::Resource::Property
  module Parser
    def parse(value)
      value = serializer.serialize(value)
      value = values.key(value) if values
      value
    end
  end
end
