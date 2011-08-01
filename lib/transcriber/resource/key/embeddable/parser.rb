class Transcriber::Resource::Embeddable
  module Parser
    def parse(value)
      parsed_value = resource_class.parse(value)
      one? ? parsed_value.first : parsed_value
    end
  end
end
