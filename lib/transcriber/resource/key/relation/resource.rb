class Transcriber::Resource
  class Relation
    module Resource
      def to_resource(parent)
        included = parent.__send__(name)
        return {} if !present?(parent) or !included
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
        has? ?
          "/#{parent.class.resource_name}/#{parent.id}/#{relation_name(parent)}"
        : "/#{relation_name(parent).to_s.pluralize}/#{parent.id}/#{parent.class.resource_name}"
      end
    end
  end
end