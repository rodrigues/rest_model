class RestModel
  class Property < Key
    autoload :Sender,    "rest_model/key/property/sender"
    autoload :Retriever, "rest_model/key/property/retriever"
    autoload :Response,  "rest_model/key/property/response"
    include   Sender
    include   Retriever
    include   Response

    attr_accessor :serializer, :translations

    def initialize(name, options = {})
      super
      @serializer   = options.fetch(:type, Serialization::String)
      @translations = options[:values]
    end

    def from_hash(value, resource = nil)
      value
    end
  end
end
