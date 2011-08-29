$:.push 'lib'; require 'transcriber'

class Root < Transcriber::Resource
  property :id
  embeds_one :item, if: proc {id == "1"}
end

class Item < Transcriber::Resource
  property :id
end

@root_with_item = Root.parse({id: 1, item: {id: 2000}}).first

puts "root:     #{@root_with_item.inspect}"
puts "resource: #{@root_with_item.resource}"


@root_without_item = Root.parse({id: 100, item: {id: 2000}}).first

puts "root:     #{@root_without_item.inspect}"
puts "resource: #{@root_without_item.resource}"