require 'json'

$:.push 'lib'; require 'transcriber'

class Item < Transcriber::Resource
  property :id, field: :item_id
end

class Root < Transcriber::Resource
  embeds_many :items, start_key: 'detalhe.itens'
end

root = Root.parse({"detalhe" => {"itens" => [{"item_id" => 2000}]}}).first

puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"
puts "to_json:  #{root.resource.to_json}"