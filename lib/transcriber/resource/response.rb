module Transcriber
  class Resource
    module Response
      def normalize(model, options = {})
        model.kind_of?(Enumerable) ?
          {entries: model.map(&:resource)}
         : model.resource
      end
    end
  end
end
