class Transcriber::Resource
  module Builder
    module Associations
      def association(name, options)
        attr_accessor name
        Association.new(name, options).tap do |association|
          keys << association
          associations << association
        end
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
