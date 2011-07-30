class Hashttp::Resource
  module Resources
    autoload :Property,     'lib/model/resources/property'
    autoload :Relation,     'lib/model/resources/relation'

    extend  ActiveSupport::Concern
    include Property
    include Relation

    def resource(properties = self.class.properties, relations = self.class.relations)
      result = resource_property({}, properties)
      resource_relation(result, relations)
    end

    module ClassMethods
      def resources(entries)
        {entries: entries.map(&:resource)}
      end
    end
  end
end