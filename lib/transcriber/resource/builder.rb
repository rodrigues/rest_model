class Transcriber::Resource
  module Builder
    autoload :Associations, 'transcriber/resource/builder/associations'
    autoload :Embeddables,  'transcriber/resource/builder/embeddables'
    autoload :Properties,   'transcriber/resource/builder/properties'

    include Associations
    include Embeddables
    include Properties
  end
end