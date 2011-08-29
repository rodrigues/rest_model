$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :login
end

@root = Customer.parse({login: 'jackiechan2010'}).first

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
