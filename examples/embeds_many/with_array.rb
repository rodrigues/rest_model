require 'json'

$:.push 'lib'; require 'transcriber'

class Root < Transcriber::Resource
  embeds_many :items, class_name: "Array"
end

@root = Root.new
@root.items = ["a", "b"]

puts "resource: #{@root.resource}"
