class Transcriber::Resource::Embeddable
  module Parser
    def parse(value)
      value = resource_class.parse(value)
      one? ? value.first : value
    end

    def default_class_name
      one? ? name : name.to_s.singularize
    end

    def resource_class
      @class_name.constantize
    end
  end
end
