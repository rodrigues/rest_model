$:.push 'lib'; require 'transcriber'

class Customer < Transcriber::Resource
  property :periodicity, values: {1 => "c_53", 2 => "c_z1"}
  property :company,     values: {"amazon" => "AM", "google" => "GOOG"}
  property :type,        values: {simple: "1", complex: "2"}
end

@root = Customer.parse({periodicity: 'c_53', company: "GOOG", type: 2}).first

puts "root:     #{@root.inspect}"
puts "resource: #{@root.resource}"
puts "to_input: #{@root.to_input}"
