$:.push 'lib'; require 'transcriber'

class Item < Transcriber::Resource
  property :id
end

class Root < Transcriber::Resource
  embeds_many :items
end

root = Root.parse({"items" => [{"id" => 2000}]}).first

puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"