class Transcriber::Resource::Property
  module Parser
    def parse(value)
      translate serializer.serialize(value)
    end

    def translate(value)
      translations ? translations[value] : value
    end
  end
end
