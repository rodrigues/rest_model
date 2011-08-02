class Transcriber::Resource
  class Relation
    module Resource

      def to_resource(parent)
        #return {} if !present?(parent)
        {}
      end

      def to_relation(parent)
        name = relation_name parent
        {:rel => name, :href => "/#{parent.class.resource_name}/#{parent.id}/#{name}"}
      end

      private
      def relation_name(parent)
        relation = parent.class.relations.find do |key|
          key.resource_class == self.resource_class
        end
        relation.name or fail
      end
    end
  end
end