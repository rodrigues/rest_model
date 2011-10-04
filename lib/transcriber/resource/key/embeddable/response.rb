module Transcriber
  class Resource
    class Embeddable
      module Response
        def to_resource(parent)
          return {} unless visible?(parent)
          resource = nil

          if embedded = parent.__send__(name)
            resource = raw? ? embedded : resourcify(embedded)
          elsif many?
            resource = []
          end

          {name => resource}
        end

        private

        def resourcify(embedded)
          one? ? embedded.resource : embedded.map(&:resource)
        end
      end
    end
  end
end
