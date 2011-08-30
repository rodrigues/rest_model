$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :name
  embeds_many :phones, class_name: "Array"
end

@root = Customer.new({name: "Jackie Chan", phones: ["1391938", "893271984"]})

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
