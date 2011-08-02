class Transcriber::Resource
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
      @class_name.constantize
    end
  end
end
