$:.push 'lib'; require 'transcriber'

class Item < Transcriber::Resource
  property :id
end

class Root < Transcriber::Resource
  property :id
  embeds_many :items, if: proc {id == "10"}
end

@root_with_items = Root.parse({"id" => 10, "items" => [{"id" => 2000}]}).first

puts "root:     #{@root_with_items.inspect}"
puts "resource: #{@root_with_items.resource}"


@root_without_items = Root.parse({"id" => 1, "items" => [{"id" => 2000}]}).first

puts "root:     #{@root_without_items.inspect}"
puts "resource: #{@root_without_items.resource}"