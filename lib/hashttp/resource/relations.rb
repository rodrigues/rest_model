module Hashttp
  class Resource
    module Relations
      def relations
        @relations ||= []
      end

      def embeds_one(name, options = {})
        embed(name, options, false)
      end

      def embeds_many(name, options = {})
        embed(name, options, true)
      end

      def embed(name, options, many)
        attr_accessor name

        relations<<(OpenStruct.new).tap do |r|
          r.name       = name
          r.class_name = (options.delete(:class_name) || name).to_s.camelize
          r.start_key  =  options.delete(:start_key)
          r.one        = !many
          r.many       =  many
          r.options    = options
        end
      end
    end
  end
end