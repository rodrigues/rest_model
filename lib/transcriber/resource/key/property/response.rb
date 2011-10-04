module Transcriber
  class Resource
    class Property
      module Response
        def to_resource(parent)
          visible?(parent) ? {name => parent.__send__(name)} : {}
        end
      end
    end
  end
end
