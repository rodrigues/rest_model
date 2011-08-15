# encoding: utf-8

$:.push 'lib'; require 'transcriber'

class Root < Transcriber::Resource
  property :key, id: true

  property :locale, visible: false

  embeds_many :names, class_name: 'Hash', visible: false
  property :name,     values: proc {names[locale]}
end


@root = Root.parse({'locale' => 'pt-BR',
                    'key' => 19190839,
                    'names'   => {
                      'en'    => 'Woot',
                      'pt-BR' => 'Úia',
                      'es'    => 'Me gusta'
                   }}).first

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
