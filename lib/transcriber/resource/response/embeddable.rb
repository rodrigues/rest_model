module Transcriber
  class Resource
    module Response
      module Embeddable
        def to_resource(parent)
          return {} unless visible?(parent)

          resource = nil

          if embedded = parent.__send__(name)
            resource = one? ? embedded.resource : embedded.map(&:resource)
          elsif many?
            resource = []
          end

          {name => resource}
        end
      end
    end
  end
end
