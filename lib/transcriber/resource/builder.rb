class Transcriber::Resource
  module Builder
    autoload :Relations,   'transcriber/resource/builder/relations'
    autoload :Embeddables, 'transcriber/resource/builder/embeddables'
    autoload :Properties,  'transcriber/resource/builder/properties'
    include   Relations
    include   Embeddables
    include   Properties
  end
end