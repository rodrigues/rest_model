class Transcriber::Resource
  module Builder
    module Associations
      def association(name, options)
        attr_accessor name
        keys << Association.new(name, options)
      end

      def has_one(name, options = {})
        options.merge!(many: false, has: true)
        association(name, options)
      end

      def has_many(name, options = {})
        options.merge!(many: true, has: true)
        association(name, options)
      end

      def belongs_to(name, options = {})
        options.merge!(many: false, has: false)
        association(name, options)
      end
    end
  end
end
