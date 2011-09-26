$:.push 'lib'; require 'transcriber'

class Root < Transcriber::Resource
  embeds_one :item
end

class Item < Transcriber::Resource
  property :id
end

@root = Root.parse({item: {id: 2000}}).first

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
