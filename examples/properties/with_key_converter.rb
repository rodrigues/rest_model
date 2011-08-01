$:.push 'lib'; require 'transcriber'

Transcriber::Resource.convert_input_keys = lambda do |keys|
  keys.map {|key| key.to_s.upcase}
end

class Customer < Transcriber::Resource
  property :login
end

root = Customer.parse({"LOGIN" => 2000}).first

puts "root:     #{root.inspect}"
puts "resource: #{root.resource}"
