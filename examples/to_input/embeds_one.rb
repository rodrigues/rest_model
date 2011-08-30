$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :login, field: 'hidden.login'
  embeds_one :address
end

class Address < Transcriber::Resource
  properties :street, :number
end

@root = Customer.new(login: 'jackiechan2010', address: {street: "Aurora St", number: 666})

puts "root.to_input: #{@root.to_input}"


puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"