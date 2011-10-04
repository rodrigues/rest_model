class RestModel
  class Href
    module Response
      def to_resource(parent)
        id_key = parent.class.id_key.name
        {name => "#{RestModel::Configuration.host}/#{parent.class.resource_name}/#{parent.send(id_key)}"}
      end
    end
  end
end
