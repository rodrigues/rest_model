$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  properties :login, :name
  embeds_one :address
end

class Address < Transcriber::Resource
  properties :street, :number, :hint
end

@root = Customer.new({
  login: 'jackiechan2010',
  name: "Jackie Chan",
  address: {
    street: "Aurora St",
    number: 1833,
    hint: "near gas station"
  }
})

puts "root.to_input: #{@root.to_input(address: {without: :hint})}"
puts "root:     #{@root.inspect}"
