$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :name
end

@root = Customer.new(name: "Jackie Chan")

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
