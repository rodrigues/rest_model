module Transcriber
  class Resource
    module Serialization
      autoload :Boolean, 'transcriber/resource/serialization/boolean'
      autoload :Date,    'transcriber/resource/serialization/date'
      autoload :Float,   'transcriber/resource/serialization/float'
      autoload :String,  'transcriber/resource/serialization/string'
    end
  end
end
