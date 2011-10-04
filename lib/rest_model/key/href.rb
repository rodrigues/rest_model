class RestModel
  class Href < Key
    autoload :Response, "rest_model/key/href/response"
    include   Response

    def initialize
      super(:href)
    end
  end
end
