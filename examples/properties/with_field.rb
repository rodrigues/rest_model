$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :login, field: :customer_login
end

@root = Customer.parse({customer_login: 'jackiechan2010'}).first

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
