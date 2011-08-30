$:.push 'lib'; require 'transcriber'

class Root < Transcriber::Resource
  embeds_one :item, start_key: ""
end

class Item < Transcriber::Resource
  property :id
end

@root = Root.new(item: {id: 2000})

puts "root.to_input: #{@root.to_input}"
puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
