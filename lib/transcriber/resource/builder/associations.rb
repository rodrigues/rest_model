class Transcriber::Resource
  module Builder
    module Associations
      def has(name, options)
        attr_accessor name
        keys << Association.new(name, options)
      end

      def has_one(name, options = {})
        options.merge!(many: false)
        has(name, options)
      end

      def has_many(name, options = {})
        options.merge!(many: true)
        has(name, options)
      end
    end
  end
end
