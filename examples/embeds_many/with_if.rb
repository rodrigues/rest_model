$:.push 'lib'; require 'transcriber'

class Item < Transcriber::Resource
  property :id
end

class Root < Transcriber::Resource
  property :id
  embeds_many :items, if: proc {id == "10"}
end

root = Root.parse({"id" => 10, "items" => [{"id" => 2000}]}).first

puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"


root = Root.parse({"id" => 1, "items" => [{"id" => 2000}]}).first

puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"