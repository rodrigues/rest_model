module Transcriber
  class Resource
    module Builder
      include Keys
      include Relations
      include Embeddables
      include Resource::Property::Builder
      include Summarizations
    end
  end
end
