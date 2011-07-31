module Transcriber
  class Resource
    module Serialization
      autoload :Boolean, 'lib/transcriber/resource/serialization/boolean'
      autoload :Date,    'lib/transcriber/resource/serialization/date'
      autoload :Float,   'lib/transcriber/resource/serialization/float'
      autoload :String,  'lib/transcriber/resource/serialization/string'
    end
  end
end
