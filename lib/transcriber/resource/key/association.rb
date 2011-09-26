module Transcriber
  class Resource
    class Association < Key
      attr_reader :many

      def initialize(name, options = {})
        super
        @many       = options.fetch(:many, false)
        @class_name = options.fetch(:class_name, default_class_name).to_s.camelize
      end

      def one?
        !many?
      end

      def many?
        @many
      end

      def default_class_name
        one? ? name : name.to_s.singularize
      end

      def resource_class
        @class_name.to_s.camelize.constantize
      end

      def from_hash(attrs, resource = nil)
        return nil if attrs.nil? or attrs.empty?
        resource ? update_from_hash(resource, attrs) : create_from_hash(attrs)
      end

      def create_from_hash(attrs)
        one? ? resource_class.new(attrs)
             : Array(attrs).map {|item| resource_class.new(item)}
      end

      def update_from_hash(resource, attrs)
        one? ? resource.update_attributes(attrs)
             : resource.map {|item| item.update_attributes(item)}
      end
    end
  end
end
