$:.push 'lib'; require 'transcriber'

class Root < Transcriber::Resource
  embeds_many :items, fields: [:item1, :item2, :item3]
end

@root = Root.parse({item1: "i1", item2: "i2", item3: "i3"}).first

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
