$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :name
  embeds_one :address
end

class Address < Transcriber::Resource
  properties :street, :number
end

@root = Customer.new({
  name: "Jackie Chan",
  address: {
    street: "Aurora St",
    number: 666
  }})

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
