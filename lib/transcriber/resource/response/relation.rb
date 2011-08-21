module Transcriber
  class Resource
    module Response
      module Relation
        def to_resource(parent)
          included = parent.__send__(name)
          return {} unless visible?(parent) and included
          {name => resource_from_included(included)}
        end

        def to_relation(parent)
          {:rel => name, :href => href(parent)}
        end

        private

        def relation_name(parent)
          relation = parent.class.relations.find do |key|
            key.resource_class == self.resource_class
          end
          relation.name or fail
        end

        def resource_from_included(included)
          options = {root: false}
          one? ?
            included.resource(options)
          : included.map {|r| r.resource(options)}
        end

        def href(parent)
          id_key = parent.class.id_key.name
          has? ?
            "#{Transcriber.host}/#{parent.class.resource_name}/#{parent.send(id_key)}/#{relation_name(parent)}"
          : "#{Transcriber.host}/#{relation_name(parent).to_s.pluralize}/#{parent.send(id_key)}/#{parent.class.resource_name}"
        end
      end
    end
  end
end
