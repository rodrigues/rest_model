$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :login
  property :name
end

@root = Customer.new(login: 'jackiechan2010', name: "Jackie Chan")

puts "root.to_input: #{@root.to_input(without: :name)}"
puts "root:     #{@root.inspect}"
