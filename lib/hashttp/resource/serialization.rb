module Hashttp
  class Resource
    module Serialization
      autoload :Boolean, 'lib/model/serialization/boolean'
      autoload :Date,    'lib/model/serialization/date'
      autoload :Float,   'lib/model/serialization/float'
      autoload :String,  'lib/model/serialization/string'
    end
  end
end