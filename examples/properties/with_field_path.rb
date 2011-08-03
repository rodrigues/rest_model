$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :login, field: 'hidden.login'
end

root = Customer.parse({"hidden" => {"login" => 2000}}).first

puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"
