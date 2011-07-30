module Hashttp
  class Model
    module Properties
      def properties
        @properties ||= []
      end

      def property(name, options = {})
        attr_accessor name

        properties<<(OpenStruct.new).tap do |p|
          p.name = name
          p.serializer = (options.delete(:type)  || Serialization::String)
          p.field      = (options.delete(:field) || name).to_s.upcase
          p.values     =  options.delete(:values)
          p.options    =  options
        end
      end
    end
  end
end