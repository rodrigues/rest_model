class Transcriber::Resource::Property
  module Resource
    def to_resource(resource)
      {name => resource.__send__(name)}
    end
  end
end
