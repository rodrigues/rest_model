$:.push 'lib'; require 'transcriber'

class Root < Transcriber::Resource
  property :id
  embeds_one :item, when: proc {id == "1"}
end

class Item < Transcriber::Resource
  property :id
end

root = Root.parse({"id"=> 1, "item" => {"id" => 2000}}).first

puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"


root = Root.parse({"id"=> 100, "item" => {"id" => 2000}}).first

puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"