$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :login
  property :name
end

@root = Customer.new(login: 'jackiechan2010')

puts "root.to_input: #{@root.to_input(without_nil: true)}"
puts "root:     #{@root.inspect}"
