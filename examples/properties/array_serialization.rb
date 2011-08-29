$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :products, type: Enumerable
end

@root = Customer.parse({products: ['a', 'b', 'c']}).first

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
