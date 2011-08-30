$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :login
  has_one :service
end

@root = Customer.new(login: 'jackiechan2010')

puts "root.to_input: #{@root.to_input(relations: false)}"
puts "root:     #{@root.inspect}"
