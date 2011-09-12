$:.push 'lib'; require 'transcriber'

class Root < Transcriber::Resource
  embeds_many :items, fields: [:item1, :item2, :item3]
end

@root = Root.new(items: %w(i1 i2 i3))

puts "input:     #{@root.to_input}"
