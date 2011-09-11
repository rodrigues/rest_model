require 'json'

$:.push 'lib'; require 'transcriber'

class Root < Transcriber::Resource
  embeds_many :items, class_name: :array
end

@root = Root.new
@root.items = ["a", "b"]

puts "resource: #{@root.resource}"
