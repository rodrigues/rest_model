module Transcriber
  class Resource
    module Response
      module Property
        def to_resource(parent)
          visible?(parent) ? {name => parent.__send__(name)} : {}
        end
      end
    end
  end
end
