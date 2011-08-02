class Transcriber::Resource
  class Association
    module Resource

      def to_resource(parent)
        #return {} if !present?(parent)
        {}
      end

      def to_relation(parent)
        name = association_name parent
        {:rel => name, :href => "/#{parent.class.resource_name}/#{parent.id}/#{name}"}
      end

      private
      def association_name(parent)
        association = parent.class.associations.find  do |key|
          key.resource_class == self.resource_class
        end
        association.name or fail
      end
    end
  end
end