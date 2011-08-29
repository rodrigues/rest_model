$:.push 'lib'; require 'transcriber'

class Item < Transcriber::Resource
  property :id, type: Integer
end

class Root < Transcriber::Resource
  embeds_many :items
end

@root = Root.parse({items: [{id: 2000}, {id: 2001}]}).first

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"