class Transcriber::Resource::Embeddable
  module Resource
    def to_resource(parent)
      embedded = parent.__send__(name)

      resource = embedded.kind_of?(Enumerable) ?
                   embedded.map(&:resource)
                 : embedded.resource

      {name => resource}
    end
  end
end
