class Transcriber::Resource::Embeddable
  module Parser
    def parse(value)
      value = resource_class.parse(value)
      one? ? value.first : value
    end
  end
end
