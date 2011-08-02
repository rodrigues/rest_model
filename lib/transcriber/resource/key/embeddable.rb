class Transcriber::Resource
  class Embeddable < Relation
    autoload :Parser,   'transcriber/resource/key/embeddable/parser'
    autoload :Resource, 'transcriber/resource/key/embeddable/resource'
    include   Parser
    include   Resource
  end
end
