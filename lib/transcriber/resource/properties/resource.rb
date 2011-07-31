class Transcriber::Resource::Property
  module Resource
    def to_resource
      {name => __send__(name)}
    end
  end
end
