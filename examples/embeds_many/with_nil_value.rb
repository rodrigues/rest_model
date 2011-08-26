require 'json'

$:.push 'lib'; require 'transcriber'

class Item < Transcriber::Resource
  property :id
end

class Root < Transcriber::Resource
  embeds_many :items
end

@root = Root.new

puts "resource: #{@root.resource}"
