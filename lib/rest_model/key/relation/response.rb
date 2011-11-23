class RestModel
  class Relation
    module Response
      def to_resource(parent)
        included = parent.__send__(name)
        return {} unless visible?(parent) and included
        {name => resource_from_included(included)}
      end

      def to_relation(parent)
        {rel: name, href: href(parent)} if resource_id(parent)
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
        if has?
          "#{RestModel::Configuration.host}/#{parent.class.resource_name}/#{resource_id(parent)}/#{relation_name(parent)}"
        else
          "#{RestModel::Configuration.host}/#{relation_name(parent).to_s.pluralize}/#{resource_id(parent)}"
        end
      end

      def resource_id(parent)
        if has?
          parent.send(parent.class.id_key.name)
        else
          options[:resource_id] ?
            parent.instance_eval(&options[:resource_id])
          : parent.__send__("#{self.name}_id")
        end
      end
    end
  end
end
