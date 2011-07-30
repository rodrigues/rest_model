class Hashttp::Resource
  module Parsing
    module Relation
      def parse_relations(params, item)
        relations.inject(params) do |buffer, relation|
          buffer.merge relation.name => parse_relation(relation, item)
        end
      end

      private

      def parse_relation(relation, item)
        value = relation.class_name.constantize.parse(item, relation.start_key)
        relation.one ? value.first : value
      end
    end
  end
end