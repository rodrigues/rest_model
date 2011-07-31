module Transcriber
  class Resource
    module Responses
      def respond_with(model, options = {})
        response = model.kind_of?(Array) ?
                     model.first.class.resources(model)
                   : model.resource

        [200, {"Content-Type" => "application/json"}, response.to_json]
      end
    end
  end
end
