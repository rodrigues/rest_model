class Transcriber::Resource::Embeddable
  module Resource
    def to_resource(parent)
      return {} if !present?(parent)
      embedded = parent.__send__(name)
      resource = one? ? embedded.resource : embedded.map(&:resource)
      {name => resource}
    end
  end
end
