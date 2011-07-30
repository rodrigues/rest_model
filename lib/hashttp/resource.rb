module Hashttp
  class Resource
    autoload :Properties,    'lib/model/properties'
    autoload :Relations,     'lib/model/relations'
    autoload :Parsing,       'lib/model/parsing'
    autoload :Resources,     'lib/model/resources'
    autoload :Serialization, 'lib/model/serialization'
    autoload :Responses,     'lib/model/responses'

    extend  Properties
    extend  Relations
    extend  Parsing
    include Resources
    include Serialization

    def initialize(attrs = {})
      attrs.map {|name, value| send("#{name}=", value)}
    end
  end
end