class RestModel
  class Property < Key
    autoload :Sender,    "rest_model/key/property/sender"
    autoload :Retriever, "rest_model/key/property/retriever"
    autoload :Response,  "rest_model/key/property/response"
    include   Sender
    include   Retriever
    include   Response

    attr_accessor :serializer, :translation

    def initialize(name, options = {})
      super
      @serializer  = options.fetch(:type, Serialization::String)
      @translation = Source::Translation.new(options)
    end

    def from_hash(value, resource = nil)
      serializer == Serialization::String ? value : serializer.serialize(value)
    rescue
      value
    end
  end
end
