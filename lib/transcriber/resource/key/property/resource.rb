class Transcriber::Resource::Property
  module Resource
    def to_resource(parent)
      {name => parent.__send__(name)}
    end
  end
end
