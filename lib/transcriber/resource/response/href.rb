module Transcriber
  class Resource
    module Response
      module Href
        def to_resource(parent)
          id_key = parent.class.id_key.name
          {name => "#{Transcriber.host}/#{parent.class.resource_name}/#{parent.send(id_key)}"}
        end
      end
    end
  end
end
