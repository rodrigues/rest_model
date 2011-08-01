class Transcriber::Resource::Property
  module Resource
    def to_resource(parent)
      present?(parent) ? {name => parent.__send__(name)} : {}
    end
  end
end
