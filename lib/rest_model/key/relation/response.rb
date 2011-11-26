class RestModel
  class Relation
    module Response
      def to_resource(parent)
        included = parent.__send__(name)
        return {} unless visible?(parent) and included

        {name => resource_from_included(included)}
      end

      def to_relation(parent)
        href = href(parent)
        href ? {rel: name, href: href} : nil
      end

      private

      def resource_from_included(included)
        options = {root: false}
        one? ? included.resource(options) : included.map {|r| r.resource(options)}
      end

      def href(parent)
        if options[:href]
          parent.instance_eval(&options[:href])
        elsif resource_id(parent).nil?
          nil
        else
          host = "#{RestModel::Configuration.host}"

          has? ? "#{host}/#{parent.class.resource_name}/#{resource_id(parent)}/#{name}"
               : "#{host}/#{name.to_s.pluralize}/#{resource_id(parent)}"
        end
      end

      def resource_id(parent)
        if has?
          parent.class.id_key ? parent.send(parent.class.id_key.name) : nil
        else
          options[:resource_id] ? parent.instance_eval(&options[:resource_id])
                                : parent.__send__("#{self.name}_id")
        end
      end
    end
  end
end
