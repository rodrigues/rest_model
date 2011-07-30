class Hashttp::Resource
  module Resources
    module Relation
      def resource_relation(result, relations)
        relations.inject(result) do |buffer, relation|
          buffer.merge relation.name => to_resource(relation)
        end
      end

      private

      def to_resource(relation)
        value = __send__(relation.name)
        relation.one ? value.resource : value.map(&:resource)
      end
    end
  end
end