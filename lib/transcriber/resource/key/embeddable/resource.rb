class Transcriber::Resource::Embeddable
  module Resource
    def to_resource(parent)
      embedded = parent.__send__(name)

      resource = embedded.kind_of?(Enumerable) ?
                   embedded.map(&:resource)
                 : embedded.resource

      {name => resource}
    end

    def resource_class
      @resource_class ||= case class_name = options.slice(:class_name)
                          when {} then
                            # @TODO block situation
                            name.constantize
                          when Hash then
                            class_name.constantize
                          end
    end
  end
end
