module Transcriber
  class Resource
    class Embeddable < Association
      include Parser::Embeddable
      include Response::Embeddable
    end
  end
end
