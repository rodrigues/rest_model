$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :login, field: 'hidden.login'
end

@root = Customer.new(login: 'jackiechan2010')

puts "root.to_input: #{@root.to_input}"


puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
