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

      def from_hash(attrs)
        return nil if attrs.nil? or attrs.empty?
        one? ? resource_class.new(attrs)
             : Array(attrs).map {|item| resource_class.new(item)}
      end

      def to_input(value, options = {})
        return nil if value.nil?
        one? ? value.to_input(options) : value.map {|item| item.to_input(options)}
      end
    end
  end
end
