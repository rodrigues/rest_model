class RestModel
  class Embeddable < Association
    autoload :Sender,    "rest_model/key/embeddable/sender"
    autoload :Retriever, "rest_model/key/embeddable/retriever"
    autoload :Response,  "rest_model/key/embeddable/response"
    include   Sender
    include   Retriever
    include   Response

    attr_accessor :fields

    def initialize(name, options = {})
      super

      if fields = options[:fields]
        @class_name = :array
        @fields = fields
      end
    end

    def raw?
      %w(Hash Array).include?(@class_name.to_s.camelize)
    end

    def from_hash(attrs, resource = nil)
      raw? ? attrs : super
    end
  end
end
