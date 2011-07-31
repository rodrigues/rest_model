class Transcriber::Resource::Embeddable
  module Resource
    def to_resource(resource)
      resource = resource.__send__(name)
      resource = resource.map(&:resource) if resource.kind_of?(Enumerable)
      {name => resource}
    end
  end
end
