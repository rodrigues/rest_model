class Transcriber::Resource
  module Builder
    module Associations
      def has_one(name, options = {})
        attr_accessor name
        keys << Association.new(name, options)
      end
    end
  end
end
