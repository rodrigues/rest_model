module Transcriber
  class Resource
    module Responses
      def respond_with(model, options = {})
        response = model.kind_of?(Enumerable) ?
                     {entries: model.map(&:resource)}
                   : model.resource

        [200, {"Content-Type" => "application/json"}, response.to_json]
      end
    end
  end
end
