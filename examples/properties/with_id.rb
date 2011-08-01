$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  id
end

root = Customer.parse({"id" => 2000}).first

puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"
