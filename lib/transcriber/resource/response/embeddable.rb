module Transcriber
  class Resource
    module Response
      module Embeddable
        def to_resource(parent)
          return {} unless visible?(parent)
          embedded = parent.__send__(name)
          resource = one? ? embedded.resource : embedded.map(&:resource)
          {name => resource}
        end
      end
    end
  end
end
